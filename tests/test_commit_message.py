import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


HELPER = Path(__file__).resolve().parents[1] / "lazygit/opencode-commit-message.sh"


class CommitMessageTest(unittest.TestCase):
    def run_helper(self, events, *, staged=True, failure=False):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            git = root / "git"
            git.write_text("#!/bin/sh\n" + ("echo staged-diff\n" if staged else "exit 0\n"))
            opencode = root / "opencode"
            opencode.write_text(
                "#!/bin/sh\n"
                'printf "%s\\n" "$@" > "$ARGS"\n'
                + ("echo unavailable >&2\nexit 1\n" if failure else
                   "cat <<'EVENTS'\n" + "\n".join(json.dumps(e) for e in events) + "\nEVENTS\n")
            )
            git.chmod(0o755)
            opencode.chmod(0o755)
            env = dict(os.environ, PATH=f"{root}:{os.environ['PATH']}", ARGS=str(root / "args"))
            result = subprocess.run(["sh", str(HELPER)], env=env, capture_output=True, text=True)
            args = (root / "args").read_text() if (root / "args").exists() else ""
            return result, args

    def test_message(self):
        result, args = self.run_helper([
            {"type": "step_start"},
            {"type": "text", "part": {"text": "feat: save changes\n"}},
            {"type": "step_finish"},
        ])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, "feat: save changes\n")
        self.assertIn("--archived\n--format\njson\n", args)
        self.assertNotIn("--standalone", args)

    def test_no_staged_changes(self):
        result, args = self.run_helper([], staged=False)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(result.stdout, "")
        self.assertEqual(args, "")

    def test_failure(self):
        result, _ = self.run_helper([], failure=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("unavailable", result.stderr)
        self.assertEqual(result.stdout, "")

    def test_empty_message(self):
        result, _ = self.run_helper([{"type": "step_finish"}])
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(result.stdout, "")

    def test_error_event(self):
        result, _ = self.run_helper([{"type": "error", "error": "failed"}])
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(result.stdout, "")

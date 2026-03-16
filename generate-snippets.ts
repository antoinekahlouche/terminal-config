#!/usr/bin/env bun

import { readFile, readdir, writeFile } from "node:fs/promises";
import { basename, join } from "node:path";

const rootDir = import.meta.dir;
const snippetsDir = join(rootDir, "snippets");
const outputFile = join(rootDir, "snippets.json");

const entries = await readdir(snippetsDir, { withFileTypes: true });

const snippets = await Promise.all(
	entries
		.filter((entry) => entry.isFile() && entry.name.endsWith(".md"))
		.map(async (entry) => {
			const name = basename(entry.name, ".md");
			const rawText = await readFile(join(snippetsDir, entry.name), "utf8");
			const text = rawText.replace(/\r\n/g, "\n").replace(/\n$/, "");

			return {
				name,
				keyword: `$${name}`,
				text,
			};
		}),
);

snippets.sort((left, right) => left.name.localeCompare(right.name));

await writeFile(outputFile, `${JSON.stringify(snippets, null, 2)}\n`, "utf8");

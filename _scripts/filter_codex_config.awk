function is_generated_section(header) {
	return header ~ /^\[mcp_servers\.node_repl(\.env)?\]$/ ||
		header ~ /^\[mcp_servers\.computer-use\]$/ ||
		header ~ /^\[marketplaces\.openai-bundled\]$/ ||
		header ~ /^\[marketplaces\.openai-primary-runtime\]$/ ||
		header ~ /^\[hooks\.state([.\]]|$)/
}

/^notify[[:space:]]*=.*Codex Computer Use\.app/ {
	next
}

/^\[/ {
	skip = is_generated_section($0)
}

!skip {
	if ($0 == "") {
		blank_lines++
		next
	}
	while (blank_lines > 0) {
		print ""
		blank_lines--
	}
	print
}

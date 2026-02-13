package main

// Base version information.
// We use semantic version (see https://semver.org/ for more information).
var (
	// Version is updated by the Makefile to reflect the new version when
	// releasing; a git-annotated tag sets this version.
	Version = "" // git tag, output of $(git describe --tags --always --dirty)

	// DefaultVersion is used as a fallback when version information from git
	// is not provided via go ldflags (e.g., when building with go install).
	DefaultVersion = "0.0.0-dev"
)

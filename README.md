# tmpl_smarthome_app_python

Copier template repository for scaffolding Python projects with DevContainer-first
tooling, strict quality gates, CI workflows, and MkDocs documentation.

The actual generated project content lives under `template/` and is selected via
`_subdirectory: template` in `copier.yml`.

## Template at a glance

- **Template engine:** Copier (`_min_copier_version: 9.11.3`)
- **Generated stack:** Python 3.14, `uv`, `hatchling`, `pytest`, `ruff`, `mypy`,
  `pyright`, MkDocs Material, pre-commit
- **Workspace style:** DevContainer + VS Code defaults + Taskfile commands
- **Optional toggles:** MIT license file, Codecov config, Robot Framework CI/tests

## Copier answers reference (all prompts)

All user-facing answers are defined in `copier.yml`.

| Answer key         | Type   | Default                                      | Choices                                                    | Behavior in scaffold                                                                                 |
| ------------------ | ------ | -------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `project_name`     | `str`  | _none_                                       | free text                                                  | Sets display/project names (README, MkDocs, workflow image names, package metadata).                 |
| `repo_name`        | `str`  | `project_name \| lower \| replace(' ', '-')` | free text                                                  | Used for GitHub URLs and repository naming in generated files.                                       |
| `module_name`      | `str`  | `project_name \| lower \| replace(' ', '_')` | free text                                                  | Defines Python package directory under `packages/src/<module_name>/`.                                |
| `description`      | `str`  | _none_                                       | free text                                                  | Populates generated README and package metadata description.                                         |
| `license`          | `str`  | `MIT`                                        | `MIT`, `None`                                              | Controls whether `LICENSE` is rendered and influences `codecov` question visibility/default.         |
| `codecov`          | `bool` | `license != 'None'`                          | `true`, `false`                                            | Controls rendering of `codecov.yml`; prompt only appears when license is not `None`.                 |
| `docs_style`       | `str`  | `dita`                                       | `diataxis`, `dita`, `user-journey`, `architecture`, `flat` | Controls explanatory comments/style guidance in generated MkDocs config and docs instructions.       |
| `robot_framework`  | `bool` | `false`                                      | `true`, `false`                                            | Enables Robot Framework-specific test guidance, result handling, and CI integration-test job blocks. |
| `init_git_on_copy` | `bool` | `true`                                       | `true`, `false`                                            | Enables scaffold-time `_tasks` git initialization (`git init -b main`) during `copier copy`.         |

### Internal Copier behavior

- `{{ _copier_conf.answers_file }}.jinja` writes all resolved answers into the generated
  answers file (`{{ _copier_answers|to_nice_yaml }}`).
- The `_tasks` section in `copier.yml` runs only when trusted (`--trust`/`--UNSAFE` or
  trusted template source) and only for copy operations.

## Scaffold feature set

### 1) Repository and developer environment

- **DevContainer scaffold** (`.devcontainer/*`): Docker-in-Docker, Git, GitHub CLI,
  preconfigured PATH to `.venv`, and VS Code defaults for format/lint/test workflows.
- **Post-create bootstrap** (`.devcontainer/post-create.sh`):
  - syncs Python dependencies via `uv`
  - verifies git repository presence
  - updates version file from git tags
  - installs pre-commit hooks
  - installs `beads-mcp` and `showboat` tools
  - initializes `bd` issue tracking if missing
- **Editor and formatting baseline:** `.editorconfig`, `.prettierrc.json`,
  `.prettierignore`, `.ecrc`, `.gitignore`, and `.gitattribures`.

### 2) Python project scaffold

- Package layout under `packages/` with:
  - `src/{{module_name}}/__init__.py` (robust version fallback logic)
  - `src/{{module_name}}/config.py` (typed `pydantic-settings` config)
  - `src/{{module_name}}/main.py` placeholder
  - `tests/` with shared fixtures and async helpers
- `packages/pyproject.toml` includes:
  - Python `>=3.14`
  - build backend (`hatchling`)
  - runtime deps (`pydantic`, `pydantic-settings`)
  - strict `pytest`, `coverage`, `ruff`, `mypy`, and `pyright` defaults
  - `setuptools_scm` version strategy and generated `_version.py`

### 3) Task automation

- Top-level `Taskfile.yml` with commands for:
  - planning (`task plan*` wrappers for `bd`)
  - tests (`task test`, backend/frontend splits, integration hooks)
  - lint/typecheck (`task lint`, `task typecheck`, `task check`)
  - docs (`task docs:serve`, `task docs:build`)
  - dev servers and dependency sync tasks

### 4) Documentation system

- MkDocs Material scaffold (`mkdocs.yml`) with navigation/search/theme defaults.
- `docs_style` answer adjusts the documentation framework guidance comments (Diátaxis,
  DITA-style, user-journey, architecture, or flat).
- Build excludes internal directories (`TODO/`, `demos/`, and testing template file).

### 5) CI/CD and GitHub automation

- **Main CI workflow** (`.github/workflows/ci.yml`):
  - lint/type-check job
  - unit tests + coverage upload/artifacts
  - complexity checks
  - optional Robot Framework integration test job when enabled
- **DevContainer image workflow** (`devcontainer-build.yml`): builds and pushes a cached
  devcontainer image to GHCR (push/schedule/manual).
- **Docs workflow** (`docs.yml`): PR build validation + main-branch GitHub Pages
  deployment.
- **GitHub guidance assets:** Copilot instructions, prompt templates, and PR template.

### 6) Quality gates and contribution workflow

- `.pre-commit-config.yaml` wires EditorConfig, basic hygiene checks, spellcheck,
  Prettier, Ruff, and mypy.
- Local hooks also enforce `bd` sync expectations during `pre-push` / `post-merge`.
- `AGENTS.md` documents contributor/agent workflow and handoff expectations.

## Conditional files and features

- `LICENSE` is rendered only when `license == "MIT"`.
- `codecov.yml` is rendered only when `codecov == true`.
- Robot Framework-specific behavior appears when `robot_framework == true`, including:
  - additional CI integration-test job
  - Robot-aware test summary script behavior
  - Robot-aware testing instructions in `.github/instructions`

## Usage notes

### Scaffold a project

```bash
copier copy --trust . <target-directory>
```

The trust flag is required for `_tasks` execution (including `init_git_on_copy`).

### Update from template changes

```bash
copier update --trust
```

## Maintainer guidance

- Keep user prompts and defaults in `copier.yml` authoritative.
- Keep generated-user docs in `template/README.md.jinja`.
- Keep maintainer/template behavior docs in this repository `README.md`.

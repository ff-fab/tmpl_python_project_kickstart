# Changelog

## [1.2.0](https://github.com/ff-fab/tmpl_python_project_kickstart/compare/v1.1.0...v1.2.0) (2026-02-21)


### Features

* modernize template (root pyproject.toml, Zensical, pinned uv) ([#19](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/19)) ([0bb334b](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/0bb334bce1533d6bf44b3f307e473c01d416b54a))
* set git user.name and user.email after repo init ([#22](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/22)) ([3d51739](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/3d51739c0263e41c4255b666ff904180dee0861f))


### Bug Fixes

* add retry mechanism for subagent failures in orchestration process ([#13](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/13)) ([7cd873e](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/7cd873e4b39f2a1b14049015b8389d519efdf2c7))
* conditionally include robotcode extension when robot_framework is enabled ([#11](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/11)) ([c7d54e1](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/c7d54e15e7de8ed96ea8a1b1ae24fe479e45582c))
* gate MIT badge on license, DRY python version, fix prettier ([#18](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/18)) ([91b1f9a](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/91b1f9adba34da41d6fce0e61894782abf2440db))
* update devcontainer window title and pre-commit hook installation ([#14](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/14)) ([ca5a618](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/ca5a618b4798aee6a636be2787aa8e9eb1e79b71))

## [1.1.0](https://github.com/ff-fab/tmpl_python_project_kickstart/compare/v1.0.0...v1.1.0) (2026-02-15)


### Features

* add ci:wait task for polling PR check status ([#10](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/10)) ([97475ee](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/97475eec84f2ef342f37a54237b401dda608a88c))
* add tooling instruction and test:file task, generalized for Robot Framework ([#9](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/9)) ([0ca9b64](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/0ca9b64a979db530c57b000f5815bc2338c3adb9))


### Bug Fixes

* backport template improvements from cosalette project ([#7](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/7)) ([beab8f2](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/beab8f2df329d5de88540d960a564a74da493dcd))

## 1.0.0 (2026-02-15)

### Features

- Add configuration test fixtures for settings cache management
  ([1b5c95b](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/1b5c95be04e05aaaef4a1a103a4465b91375c33e))
- Add coverage threshold configuration and update test summary script
  ([0b12bd1](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/0b12bd18199fbf8553ae9e0265e083b11425e6c9))
- Add coverage threshold option to copier answers in README
  ([2f53d54](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/2f53d543ecbc41ebcac843cc59981e8110eda2e3))
- add GitHub Flow, branch protection, and release-please automation
  ([#1](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/1))
  ([10d274c](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/10d274cae38dc41b5132c607ec7c4d368cf10e53))
- Add new Jinja template for answers file
  ([6446149](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/6446149e786063cdc0548f4455fe7eb4748bc1c9))
- Add new Jinja template for answers file
  ([4360643](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/43606433c9ed97ec24a2f549a08c5d38288ee74b))
- Add project configuration files and initial setup
  ([3b5fa98](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/3b5fa98417478f3c6cfb5b7cabcdd255fdfc09a1))
- Add README and project scaffolding files for Python template
  ([8203944](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/82039448a96d89e4586d36488981e6b59add93d0))
- Add SKILL.md for pre-PR quality gate workflow and update .prettierignore
  ([65a53bf](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/65a53bf849e9fca95742b48c98bccc788ab1d301))
- Add subdirectory configuration to copier.yml
  ([3611ffa](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/3611ffac5ef8b3d3bb3bb8d16eebf15705a849be))
- Add Taskfile for cross-platform task management and CI integration
  ([2e27ed7](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/2e27ed7352f28fb98c0cbf2976eda76666a7f7da))
- Add Taskfile.yml and summarize_tests.py script for unified test result summary
  ([abee32a](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/abee32a71df4571bbcb7f33b33741190a2c6b3df))
- add version handling and editorconfig checker for improved project setup
  ([#3](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/3))
  ([dac0e65](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/dac0e6507ae689a5b425148410fa1674cd9ece70))
- Create new Jinja template for answers file with YAML formatting
  ([2dc8a4d](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/2dc8a4dc2806f14a0c9687fbd9eebbe086688593))

### Bug Fixes

- git initialization in copier.yml and update Taskfile.yml for testing and linting
  ([cd62d67](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/cd62d67048d9c39dd1471d626fdcc92be2ab384f))
- resolve initial pre-commit warnings and enhance project template
  ([#4](https://github.com/ff-fab/tmpl_python_project_kickstart/issues/4))
  ([c8f59fc](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/c8f59fc757f62670cd1d04dc8e0357f0d0820aa4))
- Update environment paths in devcontainer and improve docstring formatting
  ([fa66b09](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/fa66b093c45c879104c278c4cb6ed25369bdf987))
- Update UV_PROJECT_ENVIRONMENT path in Dockerfile.jinja
  ([e359a60](https://github.com/ff-fab/tmpl_python_project_kickstart/commit/e359a608be25d5df1f641dbdc8e64927ed070ed7))

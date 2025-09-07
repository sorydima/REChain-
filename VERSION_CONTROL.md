# Version Control Guide for REChain

This guide outlines best practices for version control using Git in the REChain project.

## Git Workflow

### Branching Strategy

#### Main Branches
- `main`: Production-ready code
- `develop`: Integration branch for features

#### Feature Branches
- `feature/feature-name`: For new features
- `bugfix/bug-description`: For bug fixes
- `hotfix/critical-fix`: For urgent production fixes

### Workflow Steps

1. Create feature branch from `develop`
2. Make commits with clear messages
3. Push branch to remote
4. Create pull request
5. Code review and testing
6. Merge to `develop`
7. Release to `main` when ready

## Commit Guidelines

### Commit Message Format
```
type(scope): description

[optional body]

[optional footer]
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance

### Examples
```
feat(auth): add JWT token validation

fix(ui): resolve login button alignment

docs(readme): update installation instructions
```

## Branch Management

### Creating Branches
```bash
git checkout -b feature/user-authentication
```

### Switching Branches
```bash
git checkout develop
```

### Merging Branches
```bash
git checkout develop
git merge feature/user-authentication
```

### Deleting Branches
```bash
git branch -d feature/user-authentication
git push origin --delete feature/user-authentication
```

## Pull Requests

### PR Template
- Title: Clear, descriptive title
- Description: What changes, why, how to test
- Screenshots: For UI changes
- Related issues: Link to issues

### Review Process
- At least one reviewer
- Automated tests pass
- Code follows style guidelines
- Documentation updated

## Rebasing

### Interactive Rebase
```bash
git rebase -i HEAD~3
```

### Rebasing on Main
```bash
git checkout feature/branch
git rebase main
```

## Conflict Resolution

1. Identify conflicting files
2. Edit files to resolve conflicts
3. Stage resolved files
4. Complete merge/rebase

## Git Hooks

### Pre-commit Hooks
- Run linters
- Check code style
- Run tests

### Pre-push Hooks
- Run full test suite
- Check for security issues

## Best Practices

### Commit Often
- Make small, focused commits
- Commit related changes together

### Write Clear Messages
- Use imperative mood
- Be descriptive but concise

### Keep Branches Short-lived
- Merge or delete branches promptly
- Avoid long-running branches

### Use .gitignore
- Ignore build artifacts
- Ignore sensitive files
- Ignore IDE files

## Tools and Resources

- Git documentation: https://git-scm.com/doc
- GitHub flow: https://guides.github.com/introduction/flow/
- Conventional commits: https://conventionalcommits.org/

---

*This version control guide is part of the REChain documentation suite.*

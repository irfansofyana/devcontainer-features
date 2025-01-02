# Dev Container Features Collection

This repository contains my personal collection of [Dev Container Features](https://containers.dev/implementors/features/) that I've built and regularly use in my daily workflow as a software engineer. These features are designed to streamline development environment setup and enhance productivity across different projects.

## Available Features

### `kcat-apt`

A Kafka command line utility using kcat (formerly kafkacat). This feature is specifically designed for Debian/Ubuntu-based containers.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/irfanputra/devcontainer-features/kcat-apt:1": {
            "version": "latest"
        }
    }
}
```

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| version | string | "latest" | Select version of kcat (kafkacat) to install. Use distribution version format (e.g., '1.7.0-1'). |

## Repo Structure

This repository follows the standard dev container Feature structure:

```
├── src
│   └── kcat-apt
│       ├── devcontainer-feature.json   # Feature metadata and options
│       ├── install.sh                  # Installation script
│       └── README.md                   # Feature-specific documentation
├── test                               # Test files
└── README.md                          # This file
```

## Contributing

1. Fork the repository
2. Create a new feature directory under `src/`
3. Add the required files:
   - `devcontainer-feature.json`
   - `install.sh`
   - `README.md` (optional)
4. Add tests under the `test/` directory
5. Submit a pull request

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

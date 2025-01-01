# kcat (formerly kafkacat)

A command-line utility for Apache Kafka that provides functionality for producing and consuming messages, as well as various metadata operations. This feature installs kcat using the apt package manager on Debian/Ubuntu-based systems.

## Version Support

By default, this feature installs the latest version available in the distribution's repository. You can specify a particular version using the `version` option in your devcontainer.json:

```jsonc
{
    "features": {
        "ghcr.io/irfanputra/devcontainer-features/kcat-apt:1": {
            "version": "1.7.0-1"  // Use specific version
            // or
            "version": "latest"   // Use latest version (default)
        }
    }
}
```

To check available versions in your base image:
```bash
apt-cache policy kafkacat
```

## Usage Examples

After installation, you can use either `kcat` or `kafkacat` command (they are symlinked):

```bash
# Consume messages
kcat -b localhost:9092 -t my-topic

# Produce messages
echo "Hello Kafka" | kcat -b localhost:9092 -t my-topic -P

# List topics
kcat -b localhost:9092 -L
```

## Note

This feature only supports Debian/Ubuntu-based containers as it uses the apt package manager.

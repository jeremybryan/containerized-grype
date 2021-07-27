# Anchore Grype Container
This provides a simple containerization of the Anchore Grype container vulnerability scanner.

### Building the Image
Bulding the image is straightforward using the following:

```
docker build -t grype:<version tag> . 
```

The Dockerfile has been written to leverage the `install.sh` script provided by the Anchore team.

### Running the Image
Running the image is also straightforward using the following command line.

``` 
    docker run --name grype -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --rm grype:<version tag> <imagename>:<version tag> \
    --scope all-layers -f high -o json > grype.json 
```

The conainer respects all command line arguments allowed by grype. In the above:

 *  `--scope` specifies what layers we want to be scanned given grype scans operating system packages and application layer packages
 *  `-f`      specifies that we want the scan to fail if any vulnerabilities at the `high` level are found

### Help
To see all the configuration options simply run
``` docker run --name grype --rm grype:<version tag> ```

### Reference
For information about the `grype` project visit https://github.com/anchore/grype

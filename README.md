# Docker Selenium

## Quick Start

```bash
docker run --name selenium --rm \
    cedvan/selenium:2.44
```
*Port by default to Selenium is 4444*

## Selenium Options

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternately you can use docker-compose.*

Below is the complete list of available options that can be used to customize your toran proxy installation.

- **XVFB_RESOLUTION**: The resolution of screen use by selenium. Defaults to `1280x1024`
- **XVFB_DEPTH**: The depth of screen use by selenium. Possible configuration options are `16`, `24` and `32`. Defaults to `24`
- **SELENIUM_BROWSER**: Brower use by selenium. Possible configuration options are `firefox`, `chrome` and `opera`. Defaults to `firefox`

#### Examples

```bash
docker run --name selenium --rm \
    -e "XVFB_RESOLUTION=1920x1080" \
    -e "SELENIUM_BROWSER=firefox" \
    cedvan/selenium:2.44
```

## Remarks

Mode **Chrome and Opera don't work** for the moment, Selenium will backup automatically to start with firefox driver. I need a solution... contributions are welcome ;)
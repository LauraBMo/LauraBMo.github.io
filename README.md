# Hugo Template #

- [About](#about)
- [Dependencies](#dependencies)
- [Set Up](#set-up)
- [How to configure](#how-to-configure)
- [License](#license)

## About

A ready out-of-the-box project to build your website using [Hugo](https://gohugo.io/) with GitHub Pages and GitHub
Actions as Continuous Delivery.

In a local environment provide a [Docker](https://www.docker.com/) isolation with [Traefik](https://traefik.io/) routing
to avoid the ugly `http://localhost:666/...` url and reproduce a more consistent environment between CD and local
development.

## Dependencies

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [GNU Make](https://www.gnu.org/software/make/) (recommended, but not mandatory)

## Set Up

> In few steps you can have a cool website!

1. Set values in [.env](/.env)
   1. **HUGO_VERSION**: The Hugo version which you will use. This really corresponds to Hugo Docker Image, check it out on
     its [DockerHub](https://hub.docker.com/r/peaceiris/hugo/tags?page=1&ordering=last_updated).
   2. **LOCAL_PORT**: The local port of Hugo Server.
   3. **LOCAL_DOMAIN**: The local domain of Hugo Server. Must be ended with top domain `.localhost`!
   4. **EXTERNAL_DOMAIN**: Your domain for hosted page. This value is used to create a `CNAME` file in your build.
   5. **GIT_DEPLOY_BRANCH**: The output branch to host the website build for GitHub Pages. (`Repo > Settings > Pages`)

2. Add your selected theme in the project! [See more](https://gohugo.io/getting-started/quick-start/#step-3-add-a-theme)

3. Fill and complete the `config.toml` file for your website.
   1. [Config file](/config/_default/config.toml)
   2. [Hugo Configuration Docs](https://gohugo.io/getting-started/configuration/)

4. Check in the local environment your coolest website.
   1. Up the **docker-compose**. Using make: `make up` or raw method: `docker-compose up -d --remove-orphans` in your
    terminal.
   2. Open in your browser [](http://mywebsite.localhost)

5. Enable the GitHub Pages in your repository and set the right DNS registers in your provider.
   1. Remember, the git branch must be the same that set in the `.env` file!
   2. [GitHub Pages Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
   3. [GitHub Pages Custom DNS](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

6. Cool! You're ready to publish your website!
   1. If you're working in a different branch that `main`, merge your changes in `main` branch to publish the website.
   2. Push your changes to GitHub `git push origin main`

## How to configure

### Hugo Server parameters

Open the [`docker-compose.yml`](docker-compose.yml) file and check the value `services.hugo.command`.

### GitHub Action Workflow

In the [`deploy-hugo.yml`](.github/workflows/deploy-hugo.yml) file contains all descriptors. Check the official
documentation if you have any question.

## License

Copyleft (ɔ) - Aran Moncusí Ramírez <aran@digitalpoetinfo>

This template is released under the GPL v3 License. [Check it!](LICENSE)

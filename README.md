# MkDocs - Material - PlantUML

Create a branded static site from a set of Markdown files to host the document.

## Quick start

Create your `Dockerfile`:

```Dockerfile
FROM khanghua1505/mkdocs-material-plantuml:latest

WORKDIR your/docs/here
COPY project_docs project_docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "0.0.0.0:8000"]
```

Add the following line to `mkdocs.yml`:

```yaml
theme:
  name: material
markdown_extensions:
  - plantuml_markdown:
      server: http://www.plantuml.com/plantuml
```

For more information, visit [example](https://github.com/khanghua1505/mkdocs-material-plantuml/example)

## Inline PlantUML

The [PlantUML](https://plantuml.com/) diagram which will be converted into an image and insert in the document.

Syntax:

> index.md

    ```plantuml
    @startuml

    Goofy ->  MickeyMouse: calls
    Goofy <-- MickeyMouse: responds

    @enduml
    ```

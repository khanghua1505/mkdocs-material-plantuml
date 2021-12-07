FROM khanghua1505/mkdocs-material-plantuml:latest

WORKDIR docs/example 
COPY mkdocs.yml mkdocs.yml
COPY docs docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "0.0.0.0:8000"]
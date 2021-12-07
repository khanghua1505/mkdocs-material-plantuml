# Copyright (c) ITRVN Inc.

FROM squidfunk/mkdocs-material:8.0.5

# Environment variables
ENV PACKAGES=/usr/local/lib/python3.9/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

# Set build directory
WORKDIR /tmp

# Copy files necessary for build
COPY requirements.txt requirements.txt

# Perform build and cleanup artifacts and caches
RUN \
  pip install --no-cache-dir -r requirements.txt \
  && \
  cp ${PACKAGES}/plantuml_markdown.py ${PACKAGES}/markdown/extensions \
  && \
  rm -rf /tmp/* /root/.cache \
  && \
  find ${PACKAGES} \
  -type f \
  -path "*/__pycache__/*" \
  -exec rm -f {} \;

WORKDIR /docs
COPY example example

WORKDIR /docs/example

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "0.0.0.0:8000"]
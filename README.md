# Bionomia-IMG
Sinatra app to manipulate images in use for Bionomia, which itself is used to parse people names from structured biodiversity occurrence data, apply basic regular expressions and heuristics to disambiguate them, and then allow them to be claimed by authenticated users via [ORCID](https://orcid.org). Authenticated users may also help other users that have either ORCID or Wikidata identifiers. The web application lives at [https://bionomia.net](https://bionomia.net).

[![Build Status](https://github.com/bionomia/bionomia-img/actions/workflows/ruby.yml/badge.svg)](https://github.com/bionomia/bionomia-img/actions)

## Development Requirements

1. ruby 3.3.6+
2. requirements for `rszr` gem, [https://github.com/mtgrosser/rszr](https://github.com/mtgrosser/rszr)

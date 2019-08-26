#!/bin/bash

function serveVueApp() {
  cdcorecode
  cd $1
  npm run serve
}
package uffizzi_update_preview_action

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
)

dagger.#Plan & {
    client: env: {
        COMPOSE_FILE: string | *"docker-compose.yaml"
        UFFIZZI_SERVER: string | *"https://app.uffizzi.com"
        UFFIZZI_USER: string
        UFFIZZI_PASSWORD: string
        UFFIZZI_PROJECT: string
        PREVIEW_ID: string
    }

    actions: {
        image: core.#Pull & {
            source: "uffizzi/cli:latest"
        }
        update_preview: core.#Exec & {
            input: image.output
            args: ["preview", "update", client.env.PREVIEW_ID, client.env.COMPOSE_FILE]
            always: true
            env: {
                UFFIZZI_SERVER: client.env.UFFIZZI_SERVER 
                UFFIZZI_USER: client.env.UFFIZZI_USER 
                UFFIZZI_PASSWORD: client.env.UFFIZZI_PASSWORD 
                UFFIZZI_PROJECT: client.env.UFFIZZI_PROJECT
            } 
        }
    }
}
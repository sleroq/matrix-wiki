package handlers

import (
    "github.com/sleroq/matrix-wiki/src/components"

	"net/http"
)

type DefaultHandler struct{}

func New() *DefaultHandler {
	return &DefaultHandler{}
}

func (h *DefaultHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodPost {
		h.Post(w, r)
		return
	}
	h.Get(w, r)
}

func (h *DefaultHandler) Get(w http.ResponseWriter, r *http.Request) {
	var props ViewProps
	h.View(w, r, props)
}

func (h *DefaultHandler) Post(w http.ResponseWriter, r *http.Request) {
}

type ViewProps struct{}

func (h *DefaultHandler) View(w http.ResponseWriter, r *http.Request, props ViewProps) {
	components.Page().Render(r.Context(), w)
}

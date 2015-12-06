Doorkeeper::Application.destroy_all
Doorkeeper::Application.create(name: "rg_web", redirect_uri: "http://localhost:3000/")

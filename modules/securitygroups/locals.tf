locals {
    #alb_ingress_ports = ["80", "443", "8080", "8081", "8082", "8088", "9091", "9092", "9094", "5432"]
    alb_ingress_rules = {
        http = {
            port = 80
            description = "http"
        }
        https = {
            port = 443
            description = "https"
        }
        ssh = {
            port = 22
            description = "ssh"
        }
        backend = {
            port = 8080
            description = "backend"
        }
        backend2 = {
            port = 8081
            description = "backend2"
        }
        backend3 = {
            port = 8082
            description = "backend3"
        }
        backend4 = {
            port = 8088
            description = "backend4"
        }
        backend5 = {
            port = 9091
            description = "backend5"
        }
        backend6 = {
            port = 9092
            description = "backend6"
        }
        backend7 = {
            port = 9094
            description = "backend7"
        }
    }

    app_ingress_rules = {
        http = {
            port = 80
            description = "http"
        }
        https = {
            port = 443
            description = "https"
        }
        ssh = {
            port = 22
            description = "ssh"
        }
        backend = {
            port = 8080
            description = "backend"
        }
        backend2 = {
            port = 8081
            description = "backend2"
        }
        backend3 = {
            port = 8082
            description = "backend3"
        }
        backend4 = {
            port = 8088
            description = "backend4"
        }
        backend5 = {
            port = 9091
            description = "backend5"
        }
        backend6 = {
            port = 9092
            description = "backend6"
        }
        backend7 = {
            port = 9094
            description = "backend7"
        }
    }
}
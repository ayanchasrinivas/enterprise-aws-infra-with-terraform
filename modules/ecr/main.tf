resource "aws_ecr_repository" "hotstar_ecr_repositories" {
    for_each = toset(var.hotstar_ecr_repositories)
    name = lower("${var.ecr_mappings.name_prefix}-HOTSTAR/${each.value}")
    image_tag_mutability = "IMMUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
    encryption_configuration {
        encryption_type = "AES256"
    }
}

resource "aws_ecr_lifecycle_policy" "hotstar_ecr_repository_lifecycle_policy" {
    for_each = aws_ecr_repository.hotstar_ecr_repositories
    repository = each.value.name
    policy = jsonencode({
        rules = [
        {
            rulePriority = 1
            description  = "Keep last 50 images"
            selection = {
            tagStatus   = "any"
            countType   = "imageCountMoreThan"
            countNumber = 50
            }
            action = {
            type = "expire"
            }
        }
        ]
  })
}
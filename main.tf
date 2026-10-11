resource "google_cloud_tasks_queue_iam_member" "cloud_tasks_queue_iam_members" {
  for_each = var.cloud_tasks_queue_iam_members

  member   = each.value.member
  name     = each.value.name
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


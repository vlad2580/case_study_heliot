variable "table_schema" {
  description = "Схема таблицы BigQuery"
  type        = string
  default     = <<EOF
    [
      {
        "name": "expand",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Expand"
      },
      {
        "name": "id",
        "type": "INTEGER",
        "mode": "NULLABLE",
        "description": "Целое число - ID"
      },
      {
        "name": "key",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Key"
      },
      {
        "name": "self",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Self"
      },
      {
        "name": "project",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Project"
      },
      {
        "name": "project_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Project Name"
      },
      {
        "name": "issue_type_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Issue Type Name"
      },
      {
        "name": "resolution_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Resolution Name"
      },
      {
        "name": "created_date",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Дата/время - Created Date"
      },
      {
        "name": "resolved_date",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Дата/время - Resolved Date"
      },
      {
        "name": "severity",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Severity"
      },
      {
        "name": "team",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Team"
      },
      {
        "name": "global_release",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Global Release"
      },
      {
        "name": "story_points",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Целое число - Story Points"
      },
      {
        "name": "priority",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Priority"
      },
      {
        "name": "bug_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Bug Type"
      },
      {
        "name": "summary",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Summary"
      },
      {
        "name": "testing_scope",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Testing Scope"
      },
      {
        "name": "engineering_area",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Engineering Area"
      },
      {
        "name": "automation_test_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Automation Test Name"
      },
      {
        "name": "status",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Status"
      },
      {
        "name": "reporter",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Reporter"
      },
      {
        "name": "assignee_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Assignee Name"
      },
      {
        "name": "total_acv",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Число с плавающей точкой - Total ACV"
      },
      {
        "name": "program",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Program"
      },
      {
        "name": "execution_comments",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Execution Comments"
      },
      {
        "name": "display_in_big_picture",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Display in Big Picture"
      },
      {
        "name": "updated",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Дата/время - Updated"
      },
      {
        "name": "engineering_feedback",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Engineering Feedback"
      },
      {
        "name": "proposed_text_for_limitation_or_resolved_issue",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Proposed Text for Limitation or Resolved Issue"
      },
      {
        "name": "customer_request_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Customer Request Type"
      },
      {
        "name": "project_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Project Type"
      },
      {
        "name": "channel",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Строка - Channel"
      }
    ]
  EOF
}

# This block defines a variable for the BigQuery table schema.
variable "table_schema" {
  description = "BigQuery Table Schema"
  type        = string
  default     = <<EOF
    [
      {
        "name": "expand",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Expand"
      },
      {
        "name": "id",
        "type": "INTEGER",
        "mode": "NULLABLE",
        "description": "Integer - ID"
      },
      {
        "name": "key",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Key"
      },
      {
        "name": "self",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Self"
      },
      {
        "name": "project",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Project"
      },
      {
        "name": "project_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Project Name"
      },
      {
        "name": "issue_type_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Issue Type Name"
      },
      {
        "name": "resolution_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Resolution Name"
      },
      {
        "name": "created_date",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Date/Time - Created Date"
      },
      {
        "name": "resolved_date",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Date/Time - Resolved Date"
      },
      {
        "name": "severity",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Severity"
      },
      {
        "name": "team",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Team"
      },
      {
        "name": "global_release",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Global Release"
      },
      {
        "name": "story_points",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Integer - Story Points"
      },
      {
        "name": "priority",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Priority"
      },
      {
        "name": "bug_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Bug Type"
      },
      {
        "name": "summary",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Summary"
      },
      {
        "name": "testing_scope",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Testing Scope"
      },
      {
        "name": "engineering_area",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Engineering Area"
      },
      {
        "name": "automation_test_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Automation Test Name"
      },
      {
        "name": "status",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Status"
      },
      {
        "name": "reporter",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Reporter"
      },
      {
        "name": "assignee_name",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Assignee Name"
      },
      {
        "name": "total_acv",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Float - Total ACV"
      },
      {
        "name": "program",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Program"
      },
      {
        "name": "execution_comments",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Execution Comments"
      },
      {
        "name": "display_in_big_picture",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Display in Big Picture"
      },
      {
        "name": "updated",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "Date/Time - Updated"
      },
      {
        "name": "engineering_feedback",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Engineering Feedback"
      },
      {
        "name": "proposed_text_for_limitation_or_resolved_issue",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Proposed Text for Limitation or Resolved Issue"
      },
      {
        "name": "customer_request_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Customer Request Type"
      },
      {
        "name": "project_type",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Project Type"
      },
      {
        "name": "channel",
        "type": "STRING",
        "mode": "NULLABLE",
        "description": "String - Channel"
      }
    ]
  EOF
}

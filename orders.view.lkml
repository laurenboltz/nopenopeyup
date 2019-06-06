view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }

  measure: count_buckets {
    type: string
    sql:
    CASE WHEN ${count} <= 2 THEN "0-2"
    WHEN ${count} < 5 THEN "2-5"
    WHEN ${count} < 10 THEN "5-10"
    WHEN ${count} < 20 THEN "10-20"
    WHEN ${count} < 50 THEN "20-50"
    ELSE "other"
    END
    ;;
  }
}

view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;

  }

  dimension: tier_dimension{
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: integer # the default value, could be excluded
    sql: ${retail_price} ;;


  }


  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count1 {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}

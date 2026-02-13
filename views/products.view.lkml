view: products {
  sql_table_name: `venkata_bq.products` ;;
  drill_fields: [id]

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
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: rank {
    type: number
    sql: ${retail_price} - ${distribution_center_id} ;;
  }

  dimension: hit_limit {
    type: string
    sql:
    CASE
    WHEN ${rank} = 0 THEN '0'
    WHEN ${rank}  >=1 AND ${rank}   < 6 THEN '1–5'
    WHEN ${rank} >=6 AND ${rank}  < 11 THEN '6-10'
    WHEN ${rank}  >=11 AND ${rank}  < 16 THEN '11-15'
    WHEN ${rank}  >=16 AND ${rank}  < 21 THEN '16-20'
    WHEN ${rank}  >=21 THEN '21+'
    ELSE NULL
    END ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  name,
  distribution_centers.name,
  distribution_centers.id,
  order_items.count,
  inventory_items.count
  ]
  }

}

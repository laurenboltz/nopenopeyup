- dashboard: test
  title: test
  layout: newspaper
  elements:
  - title: test
    name: test
    model: the_look
    explore: order_items
    type: table
    fields: [orders.status, orders.count, orders.created_week, calculation_1, calculation_2]
    pivots: [orders.status]
    filters:
      orders.created_month: 2017-09
    sorts: [orders.count desc 0, orders.status]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_1, based_on: inventory_items.cost, type: sum,
        label: Calculation 1, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: calculation_2, based_on: users.city,
        type: list, label: Calculation 2, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: list}]
    row: 0
    col: 0
    width: 24
    height: 12

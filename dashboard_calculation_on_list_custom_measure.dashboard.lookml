- dashboard: test_dashboard
  title: test
  layout: newspaper
  elements:
  - title: custom measure list
    name: custom measure list
    model: the_look
    explore: order_items
    type: table
    fields: [orders.status, orders.created_week, calculation_1, calculation_2]
    pivots: [orders.status]
    filters:
      orders.created_month: 2017-09
    sorts: [orders.status]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_1, based_on: inventory_items.cost, type: sum,
        label: Calculation 1, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: calculation_2, based_on: users.city,
        type: list, label: Calculation 2, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: list}]
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 9
  - title: custom measure list 2
    name: custom measure list 2
    model: the_look
    explore: order_items
    type: table
    fields: [orders.created_week, calculation_is_female, users.is_female]
    filters:
      orders.created_month: 2017-09
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_is_female, based_on: users.is_female, type: list,
        label: Calculation_is_Female, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: list}]
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 9
  - title: table calc based on custom measure
    name: table calc based on custom measure
    model: the_look
    explore: order_items
    type: table
    fields: [orders.created_week, calculation_is_female, users.is_female]
    filters:
      orders.created_month: 2017-09
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_is_female, based_on: users.is_female, type: list,
        label: Calculation_is_Female, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: list}, {table_calculation: is_female_calc,
        label: Is female calc, expression: "  if(\n          contains(${calculation_is_female}\n\
          \            , \"Yes\"\n          )\n          , 1\n          , 0\n    \
          \    )\n", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen: {}
    row: 9
    col: 0
    width: 12
    height: 8
  - title: table calc based on custom dimension pivots
    name: table calc based on custom dimension pivots
    model: the_look
    explore: order_items
    type: table
    fields: [orders.created_week, calculation_is_female, users.is_female, orders.status,
      users.country]
    pivots: [orders.status, users.country]
    filters:
      orders.created_month: 2017-09
    sorts: [orders.created_week desc, orders.status, users.country]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_is_female, based_on: users.is_female, type: list,
        label: Calculation_is_Female, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: list}, {table_calculation: is_female_calc,
        label: Is female calc, expression: "  if(\n          contains(${calculation_is_female}\n\
          \            , \"Yes\"\n          )\n          , 1\n          , 0\n    \
          \    )\n", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen: {}
    row: 9
    col: 12
    width: 12
    height: 8

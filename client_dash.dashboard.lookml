# - dashboard: lc_feature_flags
#   # Don't forget to update the filter in Metadata tile elements if you change this dashboard id
#   # Add new dashboard name to the two metadata elements filter using a comma separation if you edit this
#   title:  Feature Flags Overview
#   layout: grid
#   auto_run: false
#   filters:
#   - name: org_id
#     title: "Org ID"
#     type: field_filter
#     explore: fact_org_feature_flag_daily
#     field: fact_org_feature_flag_daily.org_id
#     listens_to_filters: [master_org_id]
#   - name: master_org_id
#     title: "Master Org ID"
#     type: field_filter
#     explore: fact_org_feature_flag_daily
#     field: dim_org.master_org_id
#     listens_to_filters: [org id]
#     default_value: "89351"
#   rows:
#   - elements: [dashboard_attributes_note]
#     height: 40
#   - elements: [metadata_user_count, metadata_user_list]
#     height: 200
#   - elements: [maintained_by_internal_analytics_team_note]
#     height: 50
#   - elements: [org_detail_note]
#     height: 100
#   - elements: [child_org_details]
#     height: 300
#   - elements: [feature_flag_note]
#     height: 100
#   - elements: [most_recent_date]
#     height: 200
#   - elements: [drill_note]
#     height: 50
#   - elements: [num_enabled_feat_flags_today, total_feature_flag_count, non_deprecated_feature_flag_count, deprecated_feature_flag_count]
#     height: 100
#   - elements: [download_note]
#     height: 100
#   - elements: [num_enabled_feat_flags_over_time_per_org]
#     height: 500
#   - elements: [all_feature_flags_by_status_per_org]
#     height: 700
#   elements:
#   - name: dashboard_attributes_note
#     type: text
#     subtitle_text: "Dashboard attributes (excludes Internal Analytics Team members)"
#   - name: metadata_user_count
#     title: Dashboard user count over past 7 days
#     model: datamart
#     explore: looker_dashboards_metadata
#     type: single_value
#     fields: [looker_dashboards_metadata.user_count]
#     filters:
#       looker_dashboards_metadata.is_user_relevant: 'Yes'
#       looker_dashboards_metadata.query_created_date: 7 days
#       looker_dashboards_metadata.dashboard_name: "lc_feature_flags"
#     limit: 15
#     query_timezone: America/New_York
#   - name: metadata_user_list
#     title: Dashboard top users over past 90 days
#     model: datamart
#     explore: looker_dashboards_metadata
#     type: table
#     fields: [looker_dashboards_metadata.approximate_usage_in_minutes, looker_dashboards_metadata.user_name]
#     filters:
#       looker_dashboards_metadata.is_user_relevant: 'Yes'
#       looker_dashboards_metadata.query_created_date: 90 days
#       looker_dashboards_metadata.dashboard_name: "lc_feature_flags"
#     sorts: [looker_dashboards_metadata.approximate_usage_in_minutes desc]
#     limit: 15
#     query_timezone: America/New_York
#   - name: most_recent_date
#     title: Most Recent Date for which Feature Flag Data Exists
#     model: datamart
#     explore: fact_org_feature_flag_daily
#     type: single_value
#     fields: [fact_org_feature_flag_daily.most_recent_date]
#     limit: 500
#     query_timezone: America/New_York
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#   - name: maintained_by_internal_analytics_team_note
#     type: text
#     subtitle_text: "This dashboard is maintained by the Internal Analytics Team"
#   - name: org_detail_note
#     type: text
#     title_text: "Org Details"
#   - name: child_org_details
#     title: Child Org Details
#     model: datamart
#     explore: dim_org
#     type: table
#     fields: [dim_org.id, dim_org.name, dim_org.billing_plan_current]
#     listen:
#       org_id: dim_org.id
#       master_org_id: dim_org.master_org_id
#     sorts: [dim_org.id desc]
#     limit: 5000
#     column_limit: 200
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     series_labels:
#       dim_org.id: Org ID
#       dim_org.name: Org Name
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     conditional_formatting_ignored_fields: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#   - name: feature_flag_note
#     type: text
#     title_text: "Feature Flag Details"
#   - name: drill_note
#     type: text
#     subtitle_text: "Click on the numerical value below to view the feature flags comprising the value"
#   - name: num_enabled_feat_flags_today
#     title: Enabled Feature Flags Count
#     model: datamart
#     explore: fact_org_feature_flag_daily
#     type: single_value
#     fields: [fact_org_feature_flag_daily.data_date, fact_org_feature_flag_daily.feature_flag_count]
#     fill_fields: [fact_org_feature_flag_daily.data_date]
#     listen:
#       org_id: fact_org_feature_flag_daily.org_id
#       master_org_id: dim_org.master_org_id
#     filters:
#       fact_org_feature_flag_daily.is_feature_flag_enabled: 'Yes'
#       fact_org_feature_flag_daily.data_date: 1 days
#     sorts: [fact_org_feature_flag_daily.data_date desc]
#     note:
#       display: hover
#       text: "Listens to Org and Master Org ID filters"
#   - name: total_feature_flag_count
#     title: All-Time Feature Flag Count
#     model: datamart
#     explore: dim_org_feature_flag
#     type: single_value
#     fields: [dim_feature_flag_metadata.historical_feature_flag_count]
#     limit: 500
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     note:
#       display: hover
#       text: "Number of distinct feature flags that have existed since we started collecting data on June 29, 2018. Does not listen to filters."
#   - name: non_deprecated_feature_flag_count
#     title: Current Feature Flag Count
#     model: datamart
#     explore: dim_org_feature_flag
#     type: single_value
#     fields: [dim_feature_flag_metadata.historical_feature_flag_count]
#     filters:
#       dim_feature_flag_metadata.last_found_date: 1 days
#     note:
#       display: hover
#       text: "Number of non-deprecated feature flags that exist in the most recent day of data. Does not listen to filters."
#   - name: deprecated_feature_flag_count
#     title: Deprecated Feature Flag Count
#     model: datamart
#     explore: dim_org_feature_flag
#     type: single_value
#     fields: [dim_feature_flag_metadata.historical_feature_flag_count]
#     filters:
#       dim_feature_flag_metadata.last_found_date: before today
#     note:
#       display: hover
#       text: "Number of deprecated feature flags that existed prior to the most recent day of data. Does not listen to filters."
#   - name: download_note
#     type: text
#     subtitle_text: "To download results from a Look, select <b> Download Data</b> from the ⋮ dots in upper right hand corner of the tile, and set the limit to <b>All Results</b>."
#     body_text: "<center>Please note that tables on the dashboard can display <br> a maximum of 5000 rows and 200 columns</center>"
#   - name: num_enabled_feat_flags_over_time_per_org
#     title: Daily Enabled Feature Flags per Org
#     model: datamart
#     explore: fact_org_feature_flag_daily
#     type: looker_line
#     fields: [fact_org_feature_flag_daily.org_id, dim_org.name, fact_org_feature_flag_daily.data_date, fact_org_feature_flag_daily.feature_flag_count]
#     pivots: [fact_org_feature_flag_daily.org_id, dim_org.name]
#     filters:
#       fact_org_feature_flag_daily.is_feature_flag_enabled: 'Yes'
#       fact_org_feature_flag_daily.data_date: 30 days ago for 30 days
#       fact_org_feature_flag_daily.feature_flag_count: ">0"
#     listen:
#       org_id: fact_org_feature_flag_daily.org_id
#       master_org_id: dim_org.master_org_id
#     sorts: [fact_org_feature_flag_daily.data_date desc]
#     limit: 5000
#     column_limit: 200
#     stacking: ''
#     trellis: ''
#     show_value_labels: true
#     label_density: 25
#     legend_position: right
#     x_axis_gridlines: true
#     y_axis_gridlines: true
#     show_view_names: false
#     y_axes: [
#               {label: Feature Flag Count, orientation: left,
#                 series: [{axisId: fact_org_feature_flag_daily.feature_flag_count, id: 89351 - fact_org_feature_flag_daily.feature_flag_count, name: '89351'}],
#                 showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}
#             ]
#     point_style: none
#     series_types: {}
#     series_labels:
#       dim_org.name: Org Name
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_datetime_label: "%Y-%m-%d"
#     x_axis_scale: time
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     show_null_points: true
#     interpolation: linear
#   - name: all_feature_flags_by_status_per_org
#     title: Feature Flags by Current Status per Org
#     model: datamart
#     explore: dim_org_feature_flag
#     type: table
#     fields: [dim_org.master_org_id, dim_master_org.name, dim_org_feature_flag.org_id, dim_org.name, dim_feature_flag_metadata.feature_flag_name,
#             feature_flag_enabled_yes_no_list, dim_feature_flag_metadata.description]
#     pivots: [dim_org_feature_flag.org_id, dim_org.name]
#     listen:
#       org_id: dim_org_feature_flag.org_id
#       master_org_id: dim_org.master_org_id
#     sorts: [dim_org_feature_flag.org_id desc 0, feature_flag_enabled_yes_no 0, dim_org_feature_flag.feature_flag_name]
#     limit: 5000
#     column_limit: 200
#     dynamic_fields:
#     - measure: feature_flag_enabled_yes_no_list
#       based_on: dim_org_feature_flag.is_feature_flag_enabled
#       type: list
#       label: Feature Flag Enabled (Yes / No) List
#       expression:
#       value_format:
#       value_format_name:
#       _kind_hint: measure
#       _type_hint: list
#     - table_calculation: is_feature_flag_enabled_yesno
#       label: Is Feature Flag Enabled (Yes/No)
#       expression: |-
#         if(
#           contains(${feature_flag_enabled_yes_no_list}
#             , "Yes"
#           )
#           , 1
#           , 0
#         )
#       value_format: '[>0]"Yes"; "No"'
#       value_format_name:
#       _kind_hint: measure
#       _type_hint: number
#     query_timezone: America/New_York
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     series_labels:
#       dim_feature_flag_metadata.description: Feature Flag Description
#       dim_org.name: Org Name
#       dim_master_org.name: Master Org Name
#     table_theme: editable
#     limit_displayed_rows: false
#     enable_conditional_formatting: true
#     conditional_formatting:
#         [
#           {type: equal to, value: 1, background_color: "#a9c574", font_color: !!null '', color_application:
#             {collection_id: 2f0f40e1-6f45-4fd4-a33f-23c12adf13b2, palette_id: 4131b167-d92f-424d-ab05-61afecf11f78, options: {steps: 5}},
#             bold: true, italic: false, strikethrough: false, fields: !!null ''},
#           {type: equal to, value: 0, background_color: "#fc082b", font_color: !!null '', color_application:
#             {collection_id: 2f0f40e1-6f45-4fd4-a33f-23c12adf13b2, palette_id: aad917c7-d7e2-4dcd-b941-e7ebf53f2cbb},
#             bold: true, italic: false, strikethrough: false, fields: !!null ''}
#         ]
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     hidden_fields: [feature_flag_enabled_yes_no_list]
#     note:
#       display: hover
#       text: "Current Status is whether the feature was enabled/disabled for the Org as of the most recent day of data"

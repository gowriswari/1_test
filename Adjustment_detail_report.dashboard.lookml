- dashboard: adjustment_detail_report
  title: Adjustment Detail Report
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - name: hello_world
      type: looker_column

    - name: As Of Date

      title: As Of Date

      type: field_filter

      default_value: "{{ 'now' | date:'%Y-%m-%d'}}"

      allow_multiple_values: true

      required: true

      ui_config:

       type: day_range_picker

      display: inline

      model: palacc

      explore: line_item_without_fsi_report

      listens_to_filters: []

      field: line_item_report.AsOfDate

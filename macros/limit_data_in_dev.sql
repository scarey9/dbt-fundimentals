{% macro limit_data_in_dev(column_name, dev_days=3) %}
{% if target.name == 'default' %}
where {{ column_name }} >= dateadd('day', -{{dev_days}}, current_timestamp)
{% endif %}
{% endmacro %}
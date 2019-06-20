
SELECT 'DB init script';

CREATE EXTENSION plpython3u;

CREATE FUNCTION py () RETURNS text AS
$$
  import html2text
  return html2text.__author__
$$ LANGUAGE plpython3u;

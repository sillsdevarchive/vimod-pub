<ol>
{
for $x in ./bookstore/book
where $x[@category != 'WEB']
order by $x/title
return <li>{$x/title/text()}</li>
}
</ol>
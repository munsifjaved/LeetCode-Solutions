select l.book_id,
l.title,
l.author,
l.genre,
l.publication_year,
Count(b.book_id)current_borrowers
from library_books  l
join  borrowing_records  b
on l.book_id=b.book_id
group by l.book_id,l.title,
l.author,
l.genre,
l.publication_year,
l.total_copies,
b.return_date
having l.total_copies-count(b.book_id) =0  and b.return_date is null
order by current_borrowers desc,l.title asc;
Create procedure spGetCreatureById
@id int
as
Begin
	Select id, name, sound, image
	from Creatures
	where id = @id
End

Execute spGetCreatureById 2
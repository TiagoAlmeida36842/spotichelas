CREATE PROCEDURE spPlaylistTrackDown
	-- Add the parameters for the stored procedure here
	@PlaylistId int,
	@SpotifyTrackId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ThisPosition int = (SELECT TrackOrder FROM PlaylistTracks WHERE SpotifyTrackId = @SpotifyTrackId)
	DECLARE @down int = (SELECT TOP 1 TrackOrder FROM PlaylistTracks WHERE TrackOrder >  @ThisPosition ORDER BY TrackOrder asc)
	if( @down is not null)
	begin

		begin tran
		--swap   old fica com a minha position
		
		update PlaylistTracks SET TrackOrder = @ThisPosition WHERE TrackOrder = @down AND PlaylistId = @PlaylistId

		-- eu fico com a posicao dele

		update PlaylistTracks SET TrackOrder = @down WHERE SpotifyTrackId = @SpotifyTrackId AND PlaylistId = @PlaylistId

		commit
	end
	
END
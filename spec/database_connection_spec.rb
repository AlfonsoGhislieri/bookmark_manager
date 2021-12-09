require 'database_connection'

describe DatabaseConnection do
  
  it "connects to the test database" do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
  end

  it "should have persistent connection" do
    result = DatabaseConnection.setup('bookmark_manager_test')
    expect(DatabaseConnection.connection).to eq result
  end

  context '.query'
  it "Executes a query" do
    result = DatabaseConnection.setup('bookmark_manager_test')
    expect(result).to receive(:exec_params).with("SELECT * FROM bookmarks WHERE id='1';", [])
    DatabaseConnection.query("SELECT * FROM bookmarks WHERE id='1';")
  end

end
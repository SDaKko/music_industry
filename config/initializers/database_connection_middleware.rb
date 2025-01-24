class DatabaseConnectionMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      @app.call(env)
    rescue ActiveRecord::ConnectionNotEstablished, ActiveRecord::NoDatabaseError => e
      [500, {'Content-Type' => 'text/html; charset=UTF-8'}, ["<html><body>Ошибка подключения к базе данных.</body></html>"]]
    end
  end
end
class HomeController < ApplicationController
  def top
  end

  def result
    @last_budget = 0
    @budget = budget = params[:budget].to_i
    if @budget
      @last_budget = @budget
    else
      @last_budget = 1000
    end
    @sum = 0
    @menu_list = Array.new
    while(1)
      if budget <= (Menu.minimum(:price) * 1.1).floor
        break # 残額がテーブルの最小額を上回ったら処理を続行する。そうでなければ処理を抜ける
      end
      menu_candidate = Menu.where('"menus"."price" * 1.1 BETWEEN ? AND ?',  0, budget) # テーブルから予算額以下のレコードを取得する
      rand_id = rand(menu_candidate.count) # 予算額以下の価格のメニューのレコードをランダムに選択する
      menu = menu_candidate[rand_id]
      menu.price = (menu.price * 1.1).floor # 消費税
      @menu_list.append(menu) # ランダムに選択したメニューをリストに追加
      @sum += menu.price
      budget -= menu.price # 予算額からレコードの価格を引く
    end
  end

  def admin
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def update
    if params[:menu_file]
      read_data = File.open(params[:menu_file]).read
      hash = JSON.load(read_data)
      hash["data"].each do |json_obj|
        menu = Menu.new(name: json_obj["name"], price: json_obj["price"], url: json_obj["url"])
        menu.save
      end
    end
    redirect_to("/admin")
  end
end

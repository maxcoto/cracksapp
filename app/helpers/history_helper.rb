module HistoryHelper

  def history_title(history)
    (history.title || history.url).truncate(50)
  end

end

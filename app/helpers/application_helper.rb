module ApplicationHelper
  def vaga_novidade(job)
    "Novidade" if job.recent?
  end
end

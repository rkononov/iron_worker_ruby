# Bump...............
class ProgressWorker < SimpleWorker::Base

    attr_accessor :s3_key, :times

    def initialize
      @times = 1
    end

    def run
        log 'running the test worker for moi '.upcase
        log 's3_key instance_variable = ' + self.s3_key.to_s

        @times.times do |i|
            log 'loop ' + i.to_s
            sleep 1
            progress = (1.0 * i / @times * 100).round
            puts 'Setting progress to ' + progress.to_s
            set_progress(:percent=> progress, :msg=>"getting there...")
        end
    end

    def set_complete(params=nil)
        log 'SET COMPLETE YAY!' + params[:task_set_id]
    end


end

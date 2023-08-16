

function scheduling2(interviewerID)

load('info.mat','interviewers');
load('info.mat','timing');
load('info.mat','candidates');

   affected_candidates = [];
   interviewer = interviewers(interviewerID,:);
   slots = interviewer.slots{1};

   for i=1:size(slots,2)
      slot = slots(i);
        if  strcmp(slot,'0')==1 && ~isnan(timing{interviewerID,i+1})
            affected_candidates = [affected_candidates, timing{interviewerID,i+1}];
            timing{interviewerID,i+1}=NaN;
            save('info.mat','timing','-append');
        end
   end
   changed_sheduling(affected_candidates);
end

             
        
     
     
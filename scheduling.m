function scheduling(time_slot_param)
load ("info.mat","candidates",'interviewers','timing');
  % Create a two-dimensional array of Queue objects
  rows = 18;
  columns = 9;
  new_interviewers = cell(rows, columns);
  for i = 1:rows
     for j = 1:columns
         new_interviewers{i, j} = Queue();
         % Create a new instance of the Queue class
         for z=1:size(interviewers,1)
             if strcmp(interviewers.track{z}(j),'1')==1
                new_interviewers{i, j}.push(interviewers.id(z));
             end
         end

     end
  end
 
  i=1;

  while i<=size(candidates,1)
     
      time_slot=time_slot_param; % get time slot must be used

      while time_slot<=18
          isScheduled = 0;
     
          curr_candidate=candidates(i,:);
          if ((curr_candidate.selected==2)&&(strcmp(curr_candidate.scheduled{1},'111')~=1))&&(isequal(curr_candidate.scheduled{1},curr_candidate.interviewed{1}))
              temp=curr_candidate.scheduled{1}; 
              for j=1:3
                   if(strcmp(curr_candidate.scheduled{1}(j),'1')==0)
                       if j==1
                           curr_queue=new_interviewers(time_slot,str2double(curr_candidate.track));
    
                           while (curr_queue{1}.isEmpty()~=1)
                              
                               if ~isnan(timing{curr_queue{1}.top(),time_slot+1})
                                   curr_queue{1}.pop();
                                   continue;
                               end
                               curr_interviewer_id=curr_queue{1}.top();
                               interviewer_row=interviewers.id ==curr_interviewer_id;
                               if strcmp(interviewers.slots{interviewer_row}(time_slot),'1')==1                              
                                   curr_candidate.scheduled{1}(j)='1';
                                   candidates(i,:)=curr_candidate;
                                   save('info.mat','candidates','-append');
                                   curr_queue{1}.pop();
           
                                   timing{curr_interviewer_id,timing.Properties.VariableNames{time_slot+1}}=i;
                                   save('info.mat','timing','-append');
                                   isScheduled = 1;
                                   break;
    
                               else
                                   curr_queue{1}.pop(); 
                                   
                               end      
                           end
                       else
                           curr_queue=new_interviewers(time_slot,6+j);
                           while (curr_queue{1}.isEmpty()~=1)
                               if ~isnan(timing{curr_queue{1}.top(),time_slot+1})
                                   curr_queue{1}.pop();
                                   continue;
                               end
                               curr_interviewer_id=curr_queue{1}.top();
                               interviewer_row=interviewers.id ==curr_interviewer_id;
                               if strcmp(interviewers.slots{interviewer_row}(time_slot),'1')==1
                                   curr_candidate.scheduled{1}(j)='1';
                                   candidates(i,:)=curr_candidate;
                                   save('info.mat','candidates','-append');
                                   curr_queue{1}.pop();
                                   timing{curr_interviewer_id,timing.Properties.VariableNames{time_slot+1}}=i;
                                   save('info.mat','timing','-append');
                                   isScheduled=1;
                                   break
                              else
                                    curr_queue{1}.pop();
                              end
                               
                           end
                       end
                       if isScheduled==1 
                           break;
                       end
                   end
              end
              
              if strcmp(temp,curr_candidate.scheduled{1})==1    
                  time_slot=time_slot+1;
              end

          else 
              break;
          end
    
           if isScheduled==1 
                break;
           end
    
      end
      i=i+1;
     display(candidates)
  end




Customers[icon:customer_url]{
  customer_id int pk
  customer_name varchar(50)
  customer_mobile_no varchar(50)
  dob data
  password varchar(50)
  created_at timestamp
  updated_at timestamp
}

Trainers[icon:trainer_url]{
  trainer_id int pk 
  trainer_name varchar(50)
  trainer_mobile_no varchar(50)
  password varchar(50)
  experience decimal
  created_at timestamp
  updated_at timestamp
}

Plans[icon:plans_url]{
  plan_id int pk
  plan_name varchar(50)
  trainer_id int fk
  description text
  price decimal(3,3)
  start_date DATE
  end_date DATE
  has_live_sessions boolean
  created_at timestamp
  updated_at timestamp
}

consultations[icon:consultation_url]{
  consultation_id int pk 
  customer_id int fk 
  trainer_id int fk
  start_time TIME
  end_time TIME
  status
  created_at timestamp
  updated_at timestamp
}

Payments[icon:payment_url]{
  payment_id int pk
  transcation_id int 
  subscription_id int fk
  amount decimal
  created_at timestamp
  updated_at timestamp

}



Progress_tracking[icon:progress_tracking_url]{
  progress_id int pk
  customer_id int fk
  weight decimal
  body_measurements text
  
  created_at timestamp
  updated_at timestamp
}


Subscription[icon:subscriptio_url]{
  subscription_id int pk 
  customer_id int fk 
  plan_id int fk 
  status varchar(20)
  amount_paid decimal
  start_date timestamp
  end_date timestamp
  created_at timestamp
  updated_at timestamp

}

Check_ins [icon:check_ins_url]{
  check_in_id int pk
  customer_id int fk
  check_in_date DATE
  weight_ decimal
  energy_levels varchar(20)
  diet_follow text
  client_notex text

}

Trainer_notes[icon:trainer_notes_url]{
  note_id int pk
  check_in_id int fk
  trainer_id int fk
  note_content text
  created_at timestamp
}


//customer
Customers.customer_id  < Subscription.customer_id
Customers.customer_id < consultations.customer_id
Customers.customer_id < Progress_tracking.customer_id
Customers.customer_id < Subscription.customer_id
Customers.customer_id < Check_ins.customer_id

//trainer
Trainers.trainer_id < Plans.trainer_id
Trainers.trainer_id < consultations.trainer_id
Trainers.trainer_id < Trainer_notes.trainer_id

Subscription.subscription_id < Payments.subscription_id

Plans.plan_id < Subscription.plan_id
Check_ins.check_in_id < Trainer_notes.check_in_id



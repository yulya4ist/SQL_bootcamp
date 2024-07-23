create or replace function fnc_trg_person_delete_audit() returns trigger as $$
    begin
        if TG_OP = 'delete' then
            insert into person_audit(created,type_event,row_id, name, age, gender, address)
            values ((select current_timestamp at time zone 'Europe/Moscow'),
                    'D',OLD.id, OLD.name,OLD.age,OLD.gender,OLD.address);
        end if;
        return new;
    end;
$$ language plpgsql;

create trigger trg_person_delete_audit
after delete on person
for each row
execute function fnc_trg_person_delete_audit();

delete from person where id = 10;
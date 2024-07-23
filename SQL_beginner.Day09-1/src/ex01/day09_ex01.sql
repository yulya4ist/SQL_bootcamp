create function fnc_trg_person_update_audit() returns trigger as $$
    begin
        if TG_OP = 'update' then
            insert into person_audit(created, type_event, row_id, name, age, gender, address)
            values ((select current_timestamp at time zone 'Europe/Moscow'),
                    'U', old.id, old.name, old.age, old.gender, old.addres);
        end if;
        return new;
    end;
$$ language plpgsql;

create trigger trg_person_update_audit
after update on person
for each row
execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
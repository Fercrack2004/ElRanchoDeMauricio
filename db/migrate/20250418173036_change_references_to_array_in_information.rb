class ChangeReferencesToArrayInInformation < ActiveRecord::Migration[7.1]
  def up
    execute <<~SQL
      ALTER TABLE information_pages
      ALTER COLUMN "references"
      SET DATA TYPE character varying[]
      USING ARRAY["references"],
      ALTER COLUMN "references" SET DEFAULT ARRAY['0'];
    SQL
  end

  def down
    execute <<~SQL
      ALTER TABLE information_pages
      ALTER COLUMN "references"
      SET DATA TYPE character varying
      USING "references"[1],
      ALTER COLUMN "references" SET DEFAULT NULL;
    SQL
  end
end

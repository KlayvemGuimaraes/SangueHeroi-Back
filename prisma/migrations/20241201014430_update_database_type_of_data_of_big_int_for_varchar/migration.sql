/*
  Warnings:

  - The primary key for the `tbusuario_pf` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `tbusuario_pj` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "tbusuario" DROP CONSTRAINT "fk_id_usuario_pf";

-- DropForeignKey
ALTER TABLE "tbusuario" DROP CONSTRAINT "fk_id_usuario_pj";

-- AlterTable
ALTER TABLE "tbanunciante" ALTER COLUMN "telefone_anunciante" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "tbhemocentro" ALTER COLUMN "telefone_hemocentro" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "tbregis_doacao" ALTER COLUMN "comprovante_doacao" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "tbusuario" ALTER COLUMN "telefone_usuario" SET DATA TYPE TEXT,
ALTER COLUMN "id_usuario_pf" SET DATA TYPE TEXT,
ALTER COLUMN "id_usuario_pj" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "tbusuario_pf" DROP CONSTRAINT "tbusuario_pf_pkey",
ALTER COLUMN "cpf" SET DATA TYPE TEXT,
ADD CONSTRAINT "tbusuario_pf_pkey" PRIMARY KEY ("cpf");

-- AlterTable
ALTER TABLE "tbusuario_pj" DROP CONSTRAINT "tbusuario_pj_pkey",
ALTER COLUMN "cnpj" SET DATA TYPE TEXT,
ADD CONSTRAINT "tbusuario_pj_pkey" PRIMARY KEY ("cnpj");

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pf" FOREIGN KEY ("id_usuario_pf") REFERENCES "tbusuario_pf"("cpf") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pj" FOREIGN KEY ("id_usuario_pj") REFERENCES "tbusuario_pj"("cnpj") ON DELETE NO ACTION ON UPDATE NO ACTION;

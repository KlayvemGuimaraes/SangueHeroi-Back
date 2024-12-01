/*
  Warnings:

  - You are about to alter the column `telefone_anunciante` on the `tbanunciante` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `telefone_hemocentro` on the `tbhemocentro` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `comprovante_doacao` on the `tbregis_doacao` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `telefone_usuario` on the `tbusuario` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `id_usuario_pf` on the `tbusuario` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `id_usuario_pj` on the `tbusuario` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - The primary key for the `tbusuario_pf` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `cpf` on the `tbusuario_pf` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - The primary key for the `tbusuario_pj` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `cnpj` on the `tbusuario_pj` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.

*/
-- DropForeignKey
ALTER TABLE "tbusuario" DROP CONSTRAINT "fk_id_usuario_pf";

-- DropForeignKey
ALTER TABLE "tbusuario" DROP CONSTRAINT "fk_id_usuario_pj";

-- AlterTable
ALTER TABLE "tbanunciante" ALTER COLUMN "telefone_anunciante" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "tbhemocentro" ALTER COLUMN "telefone_hemocentro" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "tbregis_doacao" ALTER COLUMN "comprovante_doacao" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "tbusuario" ADD COLUMN     "senha" VARCHAR(255),
ALTER COLUMN "telefone_usuario" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "id_usuario_pf" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "id_usuario_pj" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "tbusuario_pf" DROP CONSTRAINT "tbusuario_pf_pkey",
ALTER COLUMN "cpf" SET DATA TYPE VARCHAR(255),
ADD CONSTRAINT "tbusuario_pf_pkey" PRIMARY KEY ("cpf");

-- AlterTable
ALTER TABLE "tbusuario_pj" DROP CONSTRAINT "tbusuario_pj_pkey",
ALTER COLUMN "cnpj" SET DATA TYPE VARCHAR(255),
ADD CONSTRAINT "tbusuario_pj_pkey" PRIMARY KEY ("cnpj");

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pf" FOREIGN KEY ("id_usuario_pf") REFERENCES "tbusuario_pf"("cpf") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbusuario" ADD CONSTRAINT "fk_id_usuario_pj" FOREIGN KEY ("id_usuario_pj") REFERENCES "tbusuario_pj"("cnpj") ON DELETE NO ACTION ON UPDATE NO ACTION;

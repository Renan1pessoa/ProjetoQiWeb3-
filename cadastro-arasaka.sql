-- MySQL Script gerado pelo MySQL Workbench
-- Sun Mar 16 16:05:35 2025
-- Modelo: Novo Modelo    Versão: 1.0
-- MySQL Workbench Forward Engineering

-- Desabilita restrições temporariamente para evitar erros de chave estrangeira
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Criar o banco de dados e garantir que ele será usado
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `banco_cadastro`; -- Se quiser rodar o script várias vezes sem erro
CREATE DATABASE IF NOT EXISTS `banco_cadastro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `banco_cadastro`;

-- -----------------------------------------------------
-- Criar a tabela `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` INT NOT NULL AUTO_INCREMENT, -- ID gerado automaticamente
  `email_user` VARCHAR(100) NOT NULL UNIQUE,
  `name_user` VARCHAR(45) NOT NULL,
  `password_user` VARCHAR(255) NOT NULL, -- Alterado para armazenar hashes de senha
  `phonenumber_user` VARCHAR(20) NOT NULL,
  `address_user` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Criar a tabela `logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` INT NOT NULL AUTO_INCREMENT, -- ID gerado automaticamente
  `fkuser_id` INT NOT NULL,
  `action_user` VARCHAR(255) NULL,
  `data_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Garante timestamp automático
  PRIMARY KEY (`id_log`),
  INDEX `user_id_idx` (`fkuser_id` ASC),
  CONSTRAINT `fkuser_id`
    FOREIGN KEY (`fkuser_id`)
    REFERENCES `user` (`id_user`)
    ON DELETE CASCADE  -- Deleta os logs caso o usuário seja removido
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Criar a tabela `logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `password_acess` (
    `id_acess` INT NOT NULL AUTO_INCREMENT,  -- ID gerado automaticamente
    `password_user` VARCHAR(255) NOT NULL,  -- Senha hashada
    PRIMARY KEY (`id_acess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Criar a View `vw_user_logs`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_user_logs`;
CREATE VIEW `vw_user_logs` AS
SELECT 
    u.id_user AS user_id, 
    u.name_user AS user_name, 
    u.email_user AS user_email, 
    u.phonenumber_user AS user_phone,
    u.address_user AS user_address,
    l.action_user AS action,
    l.data_time AS action_time
FROM 
    `user` u
LEFT JOIN 
    `logs` l 
ON 
    u.id_user = l.fkuser_id;

-- Restaura as configurações iniciais
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

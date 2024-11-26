-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Nov-2024 às 12:08
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_oo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carros`
--

CREATE TABLE `carros` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `disponivel` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carros`
--

INSERT INTO `carros` (`id`, `marca`, `modelo`, `ano`, `preco`, `disponivel`, `criado_em`) VALUES
(1, 'Ford', 'Focus', 2020, '77.00', 1, '2024-05-14 13:33:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitorar_perfis`
--

CREATE TABLE `monitorar_perfis` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `monitorar_perfis`
--

INSERT INTO `monitorar_perfis` (`id`, `foto`, `username`, `nome`, `data_cadastro`) VALUES
(3, 'Foto do perfil de ferqueacq\r', 'ferqueacq\r', 'Fernando Queiroz Acquesta\r', '2024-08-24 16:29:17'),
(4, 'Foto do perfil de flordiniceamoriello\r', 'flordiniceamoriello\r', 'flordinice amoriello@ - p7890\r', '2024-08-24 16:29:17'),
(5, 'Foto do perfil de enzo_goispetinato\r', 'enzo_goispetinato\r', 'Enzo Gois Petinato\r', '2024-08-24 16:29:17'),
(6, 'Foto do perfil de forrofinotrato\r', 'forrofinotrato\r', 'Forró Fino Trato\r', '2024-08-24 16:29:17'),
(7, 'Foto do perfil de designunicoantiguidades\r', 'designunicoantiguidades\r', 'Design Único Antiguidades\r', '2024-08-24 16:29:17'),
(8, 'Foto do perfil de mfatimalordelo\r', 'mfatimalordelo\r', 'Maria de Fatima Lordelo Lopes\r', '2024-08-24 16:29:17'),
(9, 'Foto do perfil de samuca_surek\r', 'samuca_surek\r', 'Rosana Surek\r', '2024-08-24 16:29:17'),
(10, 'Foto do perfil de fatima_39paixao\r', 'fatima_39paixao\r', 'Fatima Paixão\r', '2024-08-24 16:29:17'),
(11, 'Foto do perfil de alegalindo_miniindice\r', 'alegalindo_miniindice\r', 'Alexandre Galindo | Trader\r', '2024-08-24 16:29:17'),
(12, 'Foto do perfil de dulce.jolie\r', 'dulce.jolie\r', '𝐷𝑢𝑙𝑐𝑒 𝑉𝑜𝑛 𝐽𝑜𝑙𝑖𝑒\r', '2024-08-24 16:29:17'),
(13, 'Foto do perfil de fernando_henrrique32\r', 'fernando_henrrique32\r', 'Fernando Paixão\r', '2024-08-24 16:29:17'),
(14, 'Foto do perfil de elis.eugenio\r', 'elis.eugenio\r', 'Elisangela Eugenio Afonso\r', '2024-08-24 16:29:17'),
(15, 'Foto do perfil de eduardorochafr\r', 'eduardorochafr\r', 'Eduardo Rocha\r', '2024-08-24 16:29:17'),
(16, 'Foto do perfil de alphaprimo0104\r', 'alphaprimo0104\r', 'Antonio L da Conceição\r', '2024-08-24 16:29:17'),
(17, 'Foto do perfil de lavemasofiaoficial\r', 'lavemasofiaoficial\r', 'LÁ VEM A SOFIA!\r', '2024-08-24 16:29:17'),
(18, 'Foto do perfil de marcelo.tyamash\r', 'marcelo.tyamash\r', 'Marcelo Yamashita\r', '2024-08-24 16:29:17'),
(19, 'Foto do perfil de cesarolliveira_sousa\r', 'cesarolliveira_sousa\r', 'Cesar Olliver\r', '2024-08-24 16:29:17'),
(20, 'Foto do perfil de marcia_dantassantos\r', 'marcia_dantassantos\r', 'Marcia Dantas\r', '2024-08-24 16:29:17'),
(21, 'Foto do perfil de pdeloroso\r', 'pdeloroso\r', 'Paulo Cesar Deloroso\r', '2024-08-24 16:29:17'),
(22, 'Foto do perfil de angelidescostaadvogados\r', 'angelidescostaadvogados\r', 'Angelides Costa Advogados\r', '2024-08-24 16:29:17'),
(23, 'Foto do perfil de aldop._santos\r', 'aldop._santos\r', 'Aldo Pinheiro\r', '2024-08-24 16:29:17'),
(24, 'Foto do perfil de giardisan\r', 'giardisan\r', 'Sandra Linda\r', '2024-08-24 16:29:17'),
(25, 'Foto do perfil de helfsteinfabio\r', 'helfsteinfabio\r', 'Fábio Helfstein\r', '2024-08-24 16:29:17'),
(26, 'Foto do perfil de liz_pinazo.lapere\r', 'liz_pinazo.lapere\r', 'Liz\r', '2024-08-24 16:29:17'),
(27, 'Foto do perfil de janete5866\r', 'janete5866\r', 'Janete Oliveira\r', '2024-08-24 16:29:17'),
(28, 'Foto do perfil de raphaelmufalani\r', 'raphaelmufalani\r', 'Raphael Mufalani\r', '2024-08-24 16:29:17'),
(29, 'Foto do perfil de edilsonzepherino\r', 'edilsonzepherino\r', 'Edilson Alves\r', '2024-08-24 16:29:17'),
(30, 'Foto do perfil de silvia.lima.1232760\r', 'silvia.lima.1232760\r', 'Silvia Helena Lima\r', '2024-08-24 16:29:17'),
(31, 'Foto do perfil de zeinhas\r', 'zeinhas\r', 'Ricardo Correia\r', '2024-08-24 16:29:17'),
(32, 'Foto do perfil de glasan5\r', 'glasan5\r', 'Gladis Calasans\r', '2024-08-24 16:29:17'),
(33, 'Foto do perfil de boeselcortonesi\r', 'boeselcortonesi\r', 'Bruno Boesel Cortonesi\r', '2024-08-24 16:29:17'),
(34, 'Foto do perfil de roseli8891\r', 'roseli8891\r', 'Roseli Lessa\r', '2024-08-24 16:29:17'),
(35, 'Foto do perfil de schunckadriana\r', 'schunckadriana\r', 'Adriana Schunck\r', '2024-08-24 16:29:17'),
(36, 'Foto do perfil de alemaobichogrilo\r', 'alemaobichogrilo\r', 'Alemão Alexandre Barros\r', '2024-08-24 16:29:17'),
(37, 'Foto do perfil de henrique_31oliveira\r', 'henrique_31oliveira\r', 'Guilherme Oliveira\r', '2024-08-24 16:29:17'),
(38, 'Foto do perfil de engenheira.civilbrunaleite\r', 'engenheira.civilbrunaleite\r', 'Engenheira Civil Bruna Leite\r', '2024-08-24 16:29:17'),
(39, 'Foto do perfil de genteboa09\r', 'genteboa09\r', 'genteboa\r', '2024-08-24 16:29:17'),
(40, 'Foto do perfil de francisco_ronaldo_ndee\r', 'francisco_ronaldo_ndee\r', 'Ronaldo Francisco Lima\r', '2024-08-24 16:29:17'),
(41, 'Foto do perfil de nego_eri\r', 'nego_eri\r', 'Erivaldo Batista Costa\r', '2024-08-24 16:29:17'),
(42, 'Foto do perfil de angelicabecker860\r', 'angelicabecker860\r', 'Angelica Becker\r', '2024-08-24 16:29:17'),
(43, 'Foto do perfil de pchsmarcio\r', 'pchsmarcio\r', 'Marcio\r', '2024-08-24 16:29:17'),
(44, 'Foto do perfil de genygois\r', 'genygois\r', 'Geny Gois\r', '2024-08-24 16:29:17'),
(45, 'Foto do perfil de fmiguel2003\r', 'fmiguel2003\r', 'Francisco Miguel\r', '2024-08-24 16:29:17'),
(46, 'Foto do perfil de juliamellojuba\r', 'juliamellojuba\r', 'Julia Mello\r', '2024-08-24 16:29:17'),
(47, 'Foto do perfil de senamediacao_\r', 'senamediacao_\r', 'Sena Mediação\r', '2024-08-24 16:29:17'),
(48, 'Foto do perfil de walter.rodrigues_06\r', 'walter.rodrigues_06\r', 'Walter Rodrigues da Silva\r', '2024-08-24 16:29:17'),
(49, 'Foto do perfil de diegoluizamoriello\r', 'diegoluizamoriello\r', 'Diego Luiz Amoriello\r', '2024-08-24 16:29:17'),
(50, 'Foto do perfil de andrea.cshessel\r', 'andrea.cshessel\r', 'Andrea Hessel\r', '2024-08-24 16:29:17'),
(51, 'Foto do perfil de d.morai.s\r', 'd.morai.s\r', 'DannY Morai’s\r', '2024-08-24 16:29:17'),
(52, 'Foto do perfil de laercio.galdino\r', 'laercio.galdino\r', 'Laercio Galdino\r', '2024-08-24 16:29:17'),
(53, 'Foto do perfil de ___.g7___\r', '___.g7___\r', 'Ⓖ⑦\r', '2024-08-24 16:29:17'),
(54, 'Foto do perfil de psicologa_marjorie_\r', 'psicologa_marjorie_\r', 'Marjorie Bezerra Silva\r', '2024-08-24 16:29:17'),
(55, 'Foto do perfil de edanissimura\r', 'edanissimura\r', 'Eda Nissimura\r', '2024-08-24 16:29:17'),
(56, 'Foto do perfil de mls.mimizinha\r', 'mls.mimizinha\r', 'Mirella Lino\r', '2024-08-24 16:29:17'),
(57, 'Foto do perfil de edivaldo.santosnascimento\r', 'edivaldo.santosnascimento\r', 'Edivaldo Santos Nascimento\r', '2024-08-24 16:29:17'),
(58, 'Foto do perfil de profjosealves\r', 'profjosealves\r', 'José Alves\r', '2024-08-24 16:29:17'),
(59, 'Foto do perfil de bruhemp\r', 'bruhemp\r', 'Bruno De Avila Hempel\r', '2024-08-24 16:29:17'),
(60, 'Foto do perfil de t3ty_18\r', 't3ty_18\r', 'T3TY 😜\r', '2024-08-24 16:29:17'),
(61, 'Foto do perfil de luzia_.bueno\r', 'luzia_.bueno\r', 'Luzia Bueno\r', '2024-08-24 16:29:17'),
(62, 'Foto do perfil de vanessahelenabrandao\r', 'vanessahelenabrandao\r', 'Vanessa Brandão\r', '2024-08-24 16:29:17'),
(63, 'Foto do perfil de danielalucia51\r', 'danielalucia51\r', 'Daniela Lucia\r', '2024-08-24 16:29:17'),
(64, 'Foto do perfil de eusoujefferson__\r', 'eusoujefferson__\r', 'jefferson\r', '2024-08-24 16:29:17'),
(65, 'Foto do perfil de solangeaugustomoraes\r', 'solangeaugustomoraes\r', 'Solange Augusto\r', '2024-08-24 16:29:17'),
(66, 'Foto do perfil de jeracdo\r', 'jeracdo\r', 'Jera Cdo\r', '2024-08-24 16:29:17'),
(67, 'Foto do perfil de fernandomedfernandes\r', 'fernandomedfernandes\r', 'Fernando Fernandes\r', '2024-08-24 16:29:17'),
(68, 'Foto do perfil de dance4all.oficial\r', 'dance4all.oficial\r', 'DANCE4ALL\r', '2024-08-24 16:29:17'),
(69, 'Foto do perfil de alexsgalv\r', 'alexsgalv\r', 'Alê Galvão\r', '2024-08-24 16:29:17'),
(70, 'Foto do perfil de kellyandriollimartins\r', 'kellyandriollimartins\r', 'Kelly Andriolli\r', '2024-08-24 16:29:17'),
(71, 'Foto do perfil de omaranka\r', 'omaranka\r', 'Omar Anka\r', '2024-08-24 16:29:17'),
(72, 'Foto do perfil de karlamatsunaga\r', 'karlamatsunaga\r', 'Karla Matsunaga\r', '2024-08-24 16:29:17'),
(73, 'Foto do perfil de edinetenet\r', 'edinetenet\r', 'Edinete Net\r', '2024-08-24 16:29:17'),
(74, 'Foto do perfil de paulinhopacheco_\r', 'paulinhopacheco_\r', 'Paulinho Pacheco\r', '2024-08-24 16:29:17'),
(75, 'Foto do perfil de eliana.silvacruz\r', 'eliana.silvacruz\r', 'Eliana Silva Cruz\r', '2024-08-24 16:29:17'),
(76, 'Foto do perfil de ferreirabruno89\r', 'ferreirabruno89\r', 'Bruno Silva\r', '2024-08-24 16:29:17'),
(77, 'Foto do perfil de felipe.pinheiro59\r', 'felipe.pinheiro59\r', NULL, '2024-08-24 16:29:17'),
(78, 'Foto do perfil de fernandocirilodelima\r', 'fernandocirilodelima\r', 'Fernando Cirilo de Lima\r', '2024-08-24 16:29:17'),
(79, 'Foto do perfil de flordinicepaixao9\r', 'flordinicepaixao9\r', 'Flordinice Paixão\r', '2024-08-24 16:29:17'),
(80, 'Foto do perfil de luziafatimapereira\r', 'luziafatimapereira\r', 'Luzia Fatima Pereira\r', '2024-08-24 16:29:17'),
(81, 'Foto do perfil de silvajura\r', 'silvajura\r', 'Jura José Silva\r', '2024-08-24 16:29:17'),
(82, 'Foto do perfil de davi.ribeiro.sousa\r', 'davi.ribeiro.sousa\r', 'Davi Ribeiro Sousa\r', '2024-08-24 16:29:17'),
(83, 'Foto do perfil de adrianoamoriello\r', 'adrianoamoriello\r', 'Adriano Amoriello\r', '2024-08-24 16:29:17'),
(84, 'Foto do perfil de symonpretaa\r', 'symonpretaa\r', 'Simone Rodrigues\r', '2024-08-24 16:29:17'),
(85, 'Foto do perfil de gilvanabrandaoprado\r', 'gilvanabrandaoprado\r', 'Gilvana Brandão Prado\r', '2024-08-24 16:29:17'),
(86, 'Foto do perfil de a_akira_ito\r', 'a_akira_ito\r', 'A Akira Ito\r', '2024-08-24 16:29:17'),
(87, 'Foto do perfil de thamiresferreira07\r', 'thamiresferreira07\r', '𝐓𝐡𝐚𝐦𝐢𝐫𝐞𝐬 𝐅𝐞𝐫𝐫𝐞𝐢𝐫𝐚\r', '2024-08-24 16:29:17'),
(88, 'Foto do perfil de felipesalves26\r', 'felipesalves26\r', 'DEIXA ACONTECER NATURALMENTE!!!\r', '2024-08-24 16:29:17'),
(89, 'Foto do perfil de flavioulinger\r', 'flavioulinger\r', 'Flavio Ferreira Ulinger\r', '2024-08-24 16:29:17'),
(90, 'Foto do perfil de fabiooliver1912\r', 'fabiooliver1912\r', 'Fabio Oliveira\r', '2024-08-24 16:29:17'),
(91, 'Foto do perfil de renatoigarashi\r', 'renatoigarashi\r', 'Renato Igarashi\r', '2024-08-24 16:29:17'),
(92, 'Foto do perfil de m_goncalves.s\r', 'm_goncalves.s\r', 'Maria Gonçalves\r', '2024-08-24 16:29:17'),
(93, 'Foto do perfil de professorcleitongomes\r', 'professorcleitongomes\r', 'Cleiton Gomes da Silva\r', '2024-08-24 16:29:17'),
(94, 'Foto do perfil de vanessabuenopsicopedagogia\r', 'vanessabuenopsicopedagogia\r', 'PSICOVANESSABUENO\r', '2024-08-24 16:29:17'),
(95, 'Foto do perfil de virgulinaalves\r', 'virgulinaalves\r', 'Virgulina Alves\r', '2024-08-24 16:29:17'),
(96, 'Foto do perfil de pescadosgourmetoficial\r', 'pescadosgourmetoficial\r', 'Peixaria Pescados Gourmet\r', '2024-08-24 16:29:17'),
(97, 'Foto do perfil de fernando.jsilva1\r', 'fernando.jsilva1\r', 'Nando Js\r', '2024-08-24 16:29:17'),
(98, 'Foto do perfil de lucia.santos18\r', 'lucia.santos18\r', 'Lúcia Santos\r', '2024-08-24 16:29:17'),
(99, 'Foto do perfil de adri_deluca\r', 'adri_deluca\r', 'Adriana De Luca\r', '2024-08-24 16:29:17'),
(100, 'Foto do perfil de charlene.castro.7902\r', 'charlene.castro.7902\r', 'Charlene Castro\r', '2024-08-24 16:29:17'),
(101, 'Foto do perfil de 2021_jonnas\r', '2021_jonnas\r', 'Jonnnas\r', '2024-08-24 16:29:17'),
(102, 'Foto do perfil de rodrigoborgesb\r', 'rodrigoborgesb\r', 'Rodrigo Borges\r', '2024-08-24 16:29:17'),
(103, 'Foto do perfil de silppinheirorocha\r', 'silppinheirorocha\r', 'silvana paixao pinheiro rocha\r', '2024-08-24 16:29:17'),
(104, 'Foto do perfil de janeteamaciel\r', 'janeteamaciel\r', 'Janete Maciel\r', '2024-08-24 16:29:17'),
(105, 'Foto do perfil de rose.deandrade.92\r', 'rose.deandrade.92\r', 'Rose de Andrade\r', '2024-08-24 16:29:17'),
(106, 'Foto do perfil de personal_regissena\r', 'personal_regissena\r', 'PERSONAL RÉGIS SENA\r', '2024-08-24 16:29:17'),
(107, 'Foto do perfil de vinnymelo_\r', 'vinnymelo_\r', 'Vinny Melo\r', '2024-08-24 16:29:17'),
(108, 'Foto do perfil de nilmara.meireles\r', 'nilmara.meireles\r', 'Nilmara Nunes\r', '2024-08-24 16:29:17'),
(109, 'Foto do perfil de mhess_el\r', 'mhess_el\r', 'Marcio Hessel Melo\r', '2024-08-24 16:29:17'),
(110, 'Foto do perfil de ivonesrios\r', 'ivonesrios\r', 'Ivone Rios\r', '2024-08-24 16:29:17'),
(111, 'Foto do perfil de walschmidt\r', 'walschmidt\r', 'Walkyria Teixeira Schmidt Rodrigues\r', '2024-08-24 16:29:17'),
(112, 'Foto do perfil de credianapvilela\r', 'credianapvilela\r', 'Crediana Caria\r', '2024-08-24 16:29:17'),
(113, 'Foto do perfil de miriam.ribeiroo\r', 'miriam.ribeiroo\r', 'Miriam Ribeiro\r', '2024-08-24 16:29:17'),
(114, 'Foto do perfil de julianofelix_11\r', 'julianofelix_11\r', 'Juliano Felix\r', '2024-08-24 16:29:17'),
(115, 'Foto do perfil de leandropapazone85\r', 'leandropapazone85\r', 'leandropapazone85 RESERVA\r', '2024-08-24 16:29:17'),
(116, 'Foto do perfil de wellseenhair\r', 'wellseenhair\r', 'WELL SEEN HAIR\r', '2024-08-24 16:29:17'),
(117, 'Foto do perfil de silviareinke\r', 'silviareinke\r', 'Silvia Cotillo\r', '2024-08-24 16:29:17'),
(118, 'Foto do perfil de wagnermfrodrigues\r', 'wagnermfrodrigues\r', 'Web Designer - Wagner Rodrigues & Soluções App\r', '2024-08-24 16:29:17'),
(119, 'Foto do perfil de tiagoo_25\r', 'tiagoo_25\r', 'Luiz Tiago\r', '2024-08-24 16:29:17'),
(120, 'Foto do perfil de evertoncarmo447\r', 'evertoncarmo447\r', 'Everton Maurício\r', '2024-08-24 16:29:17'),
(121, 'Foto do perfil de orlandoaraujo70\r', 'orlandoaraujo70\r', 'Orlando Araujo\r', '2024-08-24 16:29:17'),
(122, 'Foto do perfil de ale.c.paulino\r', 'ale.c.paulino\r', 'Ale Chaps\r', '2024-08-24 16:29:17'),
(123, 'Foto do perfil de leooyamada\r', 'leooyamada\r', 'Leonardo Yamada\r', '2024-08-24 16:29:17'),
(124, 'Foto do perfil de klevedek\r', 'klevedek\r', 'Klev\r', '2024-08-24 16:29:17'),
(125, 'Foto do perfil de rodrigo.jandre1\r', 'rodrigo.jandre1\r', 'Rodrigo Jandre\r', '2024-08-24 16:29:17'),
(126, 'Foto do perfil de vi0089\r', 'vi0089\r', 'Vi0089\r', '2024-08-24 16:29:17'),
(127, 'Foto do perfil de ka_bia_lo\r', 'ka_bia_lo\r', 'karla crisce\r', '2024-08-24 16:29:17'),
(128, 'Foto do perfil de andressaferrazpsi\r', 'andressaferrazpsi\r', 'Andressa Ferraz | Psicóloga\r', '2024-08-24 16:29:17'),
(129, 'Foto do perfil de forrodosamigos\r', 'forrodosamigos\r', 'Forró dos Amigos\r', '2024-08-24 16:29:17'),
(130, 'Foto do perfil de wilsonjunior.personal\r', 'wilsonjunior.personal\r', 'Wilson Junior Personal\r', '2024-08-24 16:29:17'),
(131, 'Foto do perfil de fernando.josedasilva2\r', 'fernando.josedasilva2\r', 'Nando Js\r', '2024-08-24 16:29:17'),
(132, 'Foto do perfil de rafaela_marcionila\r', 'rafaela_marcionila\r', 'Rafaela Marcionila\r', '2024-08-24 16:29:17'),
(133, 'Foto do perfil de _roberta_zani\r', '_roberta_zani\r', 'Roberta Zani\r', '2024-08-24 16:29:17'),
(134, 'Foto do perfil de pretaorganiza2020\r', 'pretaorganiza2020\r', 'Charlene Gisele\r', '2024-08-24 16:29:17'),
(135, 'Foto do perfil de correagab23\r', 'correagab23\r', 'Gabriel Correa\r', '2024-08-24 16:29:17'),
(136, 'Foto do perfil de fernandoaugusto7650\r', 'fernandoaugusto7650\r', 'fernando augusto fernandes\r', '2024-08-24 16:29:17'),
(137, 'Foto do perfil de miraipharma\r', 'miraipharma\r', 'Mirai Pharma\r', '2024-08-24 16:29:17'),
(138, 'Foto do perfil de miriansantanapaixao\r', 'miriansantanapaixao\r', 'Mirian Santana\r', '2024-08-24 16:29:17'),
(139, 'Foto do perfil de karla_crisce\r', 'karla_crisce\r', 'Karla Crisce\r', '2024-08-24 16:29:17'),
(140, 'Foto do perfil de artur_torres6\r', 'artur_torres6\r', 'Artur Oliveira Torres\r', '2024-08-24 16:29:17'),
(141, 'Foto do perfil de davgomes.oficial\r', 'davgomes.oficial\r', 'David Gomes\r', '2024-08-24 16:29:17'),
(142, 'Foto do perfil de cleidiana_lima_araujo\r', 'cleidiana_lima_araujo\r', '🫀𝕮𝖑𝖊𝖎𝖉𝖎𝖆𝖓𝖆 𝕬𝖗𝖆𝖚𝖏𝖔🧠\r', '2024-08-24 16:29:17'),
(143, 'Foto do perfil de leo_dicaprio58\r', 'leo_dicaprio58\r', 'LEONARDO_VIEIRA_DICAPRIO 🇪🇸\r', '2024-08-24 16:29:17'),
(144, 'Foto do perfil de alvinhomarquess\r', 'alvinhomarquess\r', 'Alvaro Oliveira\r', '2024-08-24 16:29:17'),
(145, 'Foto do perfil de elianasilva.c\r', 'elianasilva.c\r', 'Eliana Silva cruz\r', '2024-08-24 16:29:17'),
(146, 'Foto do perfil de andreiamadalenafreitas\r', 'andreiamadalenafreitas\r', 'Andreia Freitas\r', '2024-08-24 16:29:17'),
(147, 'Foto do perfil de uedatiago\r', 'uedatiago\r', 'Tiago Ueda\r', '2024-08-24 16:29:17'),
(148, 'Foto do perfil de salgadosecestasragone\r', 'salgadosecestasragone\r', 'Marlene Ragone\r', '2024-08-24 16:29:17'),
(149, 'Foto do perfil de edsonsernagiotto\r', 'edsonsernagiotto\r', 'Edson Sernagiotto\r', '2024-08-24 16:29:17'),
(150, 'Foto do perfil de phiverissimo\r', 'phiverissimo\r', 'Philipe Verissimo\r', '2024-08-24 16:29:17'),
(151, 'Foto do perfil de gabriel_muniz90\r', 'gabriel_muniz90\r', 'Gabriel Muniz\r', '2024-08-24 16:29:17'),
(152, 'Foto do perfil de anastacioangelim\r', 'anastacioangelim\r', 'Marisa Anastacio Angelim\r', '2024-08-24 16:29:17'),
(153, 'Foto do perfil de ninapretti84\r', 'ninapretti84\r', 'Nina Pretti\r', '2024-08-24 16:29:17'),
(154, 'Foto do perfil de paulochina80\r', 'paulochina80\r', 'Paulo China\r', '2024-08-24 16:29:17'),
(155, 'Foto do perfil de otaviopilz\r', 'otaviopilz\r', 'Otávio Pilz\r', '2024-08-24 16:29:17'),
(156, 'Foto do perfil de cacocomputer\r', 'cacocomputer\r', 'Games e Muito Mais 🎮\r', '2024-08-24 16:29:17'),
(157, 'Foto do perfil de daniaguiarferreira\r', 'daniaguiarferreira\r', 'Dani Aguiar\r', '2024-08-24 16:29:17'),
(158, 'Foto do perfil de prof_julianagv\r', 'prof_julianagv\r', 'Juliana Goularte\r', '2024-08-24 16:29:17'),
(159, 'Foto do perfil de professor_cleiton\r', 'professor_cleiton\r', 'Cleiton Gomes da Silva\r', '2024-08-24 16:29:17'),
(160, 'Foto do perfil de erikabarbosa09\r', 'erikabarbosa09\r', 'Erika Barbosa\r', '2024-08-24 16:29:17'),
(161, 'Foto do perfil de fer_amoriello\r', 'fer_amoriello\r', 'Fer Amoriello\r', '2024-08-24 16:29:17'),
(162, 'Foto do perfil de reginaldo_paixao_oficial\r', 'reginaldo_paixao_oficial\r', 'Reginaldo Paixão Ferreira\r', '2024-08-24 16:29:17'),
(163, 'Foto do perfil de cristiane.carrasco\r', 'cristiane.carrasco\r', 'Cristiane Carrasco\r', '2024-08-24 16:29:17'),
(164, 'Foto do perfil de patycampos444\r', 'patycampos444\r', 'Paty Campos\r', '2024-08-24 16:29:17'),
(165, 'Foto do perfil de sergio_danjos\r', 'sergio_danjos\r', 'Sérgio Dos Anjos\r', '2024-08-24 16:29:17'),
(166, 'Foto do perfil de luistele_04\r', 'luistele_04\r', 'Luis\r', '2024-08-24 16:29:17'),
(167, 'Foto do perfil de lu.paixao5\r', 'lu.paixao5\r', 'Luh❤️\r', '2024-08-24 16:29:17'),
(168, 'Foto do perfil de biocidap\r', 'biocidap\r', 'Cida Ci\r', '2024-08-24 16:29:17'),
(169, 'Foto do perfil de fernandodavid45\r', 'fernandodavid45\r', 'Fernando David\r', '2024-08-24 16:29:17'),
(170, 'Foto do perfil de arijuba48\r', 'arijuba48\r', 'Ari Junior\r', '2024-08-24 16:29:17'),
(171, 'Foto do perfil de jovslisboa\r', 'jovslisboa\r', 'Jovs Lisboa\r', '2024-08-24 16:29:17'),
(172, 'Foto do perfil de janainamartins563\r', 'janainamartins563\r', 'Janaina Martins\r', '2024-08-24 16:29:17'),
(173, 'Foto do perfil de clebersilva09\r', 'clebersilva09\r', 'Cleber™\r', '2024-08-24 16:29:17'),
(174, 'Foto do perfil de viniciusbagetto\r', 'viniciusbagetto\r', 'Vinícius\r', '2024-08-24 16:29:17'),
(175, 'Foto do perfil de mariaftaeichs\r', 'mariaftaeichs\r', 'Maria Alice Fateicha\r', '2024-08-24 16:29:17'),
(176, 'Foto do perfil de torresedson\r', 'torresedson\r', 'Edson Torres\r', '2024-08-24 16:29:17'),
(177, 'Foto do perfil de psicologaflaviacaceres\r', 'psicologaflaviacaceres\r', 'Flávia Cáceres\r', '2024-08-24 16:29:17'),
(178, 'Foto do perfil de phablyna_sousa\r', 'phablyna_sousa\r', 'Phablyna Sousa\r', '2024-08-24 16:29:17'),
(179, 'Foto do perfil de marcosfavaro84\r', 'marcosfavaro84\r', 'Marcos Fávaro\r', '2024-08-24 16:29:17'),
(180, 'Foto do perfil de haroldo_qrz\r', 'haroldo_qrz\r', 'Haroldo Qrz\r', '2024-08-24 16:29:17'),
(181, 'Foto do perfil de le.ator\r', 'le.ator\r', 'Le Allvez\r', '2024-08-24 16:29:17'),
(182, 'Foto do perfil de fernanda_de_sandrade\r', 'fernanda_de_sandrade\r', 'Fê\r', '2024-08-24 16:29:17'),
(183, 'Foto do perfil de mariavilanyrodrigues\r', 'mariavilanyrodrigues\r', 'Maria Vilany Rodrigues\r', '2024-08-24 16:29:17'),
(184, 'Foto do perfil de suelibarbatto\r', 'suelibarbatto\r', 'Sueli Barbatto\r', '2024-08-24 16:29:17'),
(185, 'Foto do perfil de melissa_pagon\r', 'melissa_pagon\r', 'Mirtes Da Flor\r', '2024-08-24 16:29:17'),
(186, 'Foto do perfil de ruan.carlos.rs3\r', 'ruan.carlos.rs3\r', 'Ruan Carlos\r', '2024-08-24 16:29:17'),
(187, 'Foto do perfil de ianahsouza_psicologa\r', 'ianahsouza_psicologa\r', 'Ianá de Souza Pereira\r', '2024-08-24 16:29:17'),
(188, 'Foto do perfil de leidesdaiana\r', 'leidesdaiana\r', 'Leides Daiana Fonseca\r', '2024-08-24 16:29:17'),
(189, 'Foto do perfil de andressafps\r', 'andressafps\r', 'Andressa Freitas\r', '2024-08-24 16:29:17'),
(190, 'Foto do perfil de cinthialana21\r', 'cinthialana21\r', 'Cinthia Lana\r', '2024-08-24 16:29:17'),
(191, 'Foto do perfil de luizcosta835\r', 'luizcosta835\r', 'Luiz Costa\r', '2024-08-24 16:29:17'),
(192, 'Foto do perfil de maramiquelan\r', 'maramiquelan\r', 'Mara Regina Miquelan\r', '2024-08-24 16:29:17'),
(193, 'Foto do perfil de ericasantana1235\r', 'ericasantana1235\r', 'Erica Santana\r', '2024-08-24 16:29:17'),
(194, 'Foto do perfil de luciabelo\r', 'luciabelo\r', 'Lúcia Belo\r', '2024-08-24 16:29:17'),
(195, 'Foto do perfil de mpsmoises\r', 'mpsmoises\r', 'Moises Pereira Santos\r', '2024-08-24 16:29:17'),
(196, 'Foto do perfil de bianacota\r', 'bianacota\r', 'Fabiana Cota Dobrochinski\r', '2024-08-24 16:29:17'),
(197, 'Foto do perfil de zyonxdesigner\r', 'zyonxdesigner\r', 'Zyon | Valdemir de Souza\r', '2024-08-24 16:29:17'),
(198, 'Foto do perfil de ricardo_paixao_1986\r', 'ricardo_paixao_1986\r', 'Ricardo Paixão Pinheiro\r', '2024-08-24 16:29:17'),
(199, 'Foto do perfil de solange.soll\r', 'solange.soll\r', 'Solange Sant\'ana\r', '2024-08-24 16:29:17'),
(200, 'Foto do perfil de roberto125321\r', 'roberto125321\r', 'Betão Macario\r', '2024-08-24 16:29:17'),
(201, 'Foto do perfil de emerson.soares.rcs\r', 'emerson.soares.rcs\r', 'Emerson\r', '2024-08-24 16:29:17'),
(202, 'Foto do perfil de priscilaakofena\r', 'priscilaakofena\r', 'Akofena\r', '2024-08-24 16:29:17'),
(203, 'Foto do perfil de jorge.rossetto\r', 'jorge.rossetto\r', 'Jorge Eduardo Rossetto\r', '2024-08-24 16:29:17'),
(204, 'Foto do perfil de rafakha\r', 'rafakha\r', 'Rafael\r', '2024-08-24 16:29:17'),
(205, 'Foto do perfil de maryanapsilva\r', 'maryanapsilva\r', 'Mariana Pedreira da Silva\r', '2024-08-24 16:29:17'),
(206, 'Foto do perfil de laisflausino\r', 'laisflausino\r', 'Lais Flausino\r', '2024-08-24 16:29:17'),
(207, 'Foto do perfil de pr_gomes\r', 'pr_gomes\r', 'Paulo Ricardo 💎\r', '2024-08-24 16:29:17'),
(208, 'Foto do perfil de julianecastro.esteticista\r', 'julianecastro.esteticista\r', 'Juliane castro\r', '2024-08-24 16:29:17'),
(209, 'Foto do perfil de gelson2018\r', 'gelson2018\r', 'Gelson Rocha\r', '2024-08-24 16:29:17'),
(210, 'Foto do perfil de fih_silva\r', 'fih_silva\r', 'Filipe Silva\r', '2024-08-24 16:29:17'),
(211, 'Foto do perfil de paulo.cruz.125\r', 'paulo.cruz.125\r', 'Paulo Cruz\r', '2024-08-24 16:29:17'),
(212, 'Foto do perfil de fbo_bike\r', 'fbo_bike\r', 'Fabio Jesus\r', '2024-08-24 16:29:17'),
(213, 'Foto do perfil de vajufeijao8424\r', 'vajufeijao8424\r', 'Vanusa Alves\r', '2024-08-24 16:29:17'),
(214, 'Foto do perfil de edualves.br\r', 'edualves.br\r', 'Edu Alves\r', '2024-08-24 16:29:17'),
(215, 'Foto do perfil de cidamiraby\r', 'cidamiraby\r', 'Cida Miraby\r', '2024-08-24 16:29:17'),
(216, 'Foto do perfil de daniisouzaj\r', 'daniisouzaj\r', 'Daniela Souza\r', '2024-08-24 16:29:17'),
(217, 'Foto do perfil de vulcanipaula\r', 'vulcanipaula\r', 'Paula Vulcani\r', '2024-08-24 16:29:17'),
(218, 'Foto do perfil de marcosvalerio1708\r', 'marcosvalerio1708\r', 'Marcos Valério\r', '2024-08-24 16:29:17'),
(219, 'Foto do perfil de arturbsilveira\r', 'arturbsilveira\r', 'Artur B. Silveira\r', '2024-08-24 16:29:17'),
(220, 'Foto do perfil de jrpolenga\r', 'jrpolenga\r', 'Joao Rezende Polenga\r', '2024-08-24 16:29:17'),
(221, 'Foto do perfil de tamaragbarbosa\r', 'tamaragbarbosa\r', 'Tamara Barbosa\r', '2024-08-24 16:29:17'),
(222, 'Foto do perfil de marcelaoliana\r', 'marcelaoliana\r', 'Marcela Oliana Santos\r', '2024-08-24 16:29:17'),
(223, 'Foto do perfil de priii_goncalvess\r', 'priii_goncalvess\r', 'Pri Morena 🌹\r', '2024-08-24 16:29:17'),
(224, 'Foto do perfil de claudineiaapd.santos\r', 'claudineiaapd.santos\r', 'Claudinéia Santos\r', '2024-08-24 16:29:17'),
(225, 'Foto do perfil de christemarcio\r', 'christemarcio\r', 'Marcio Christe\r', '2024-08-24 16:29:17'),
(226, 'Foto do perfil de dearoschel\r', 'dearoschel\r', 'Andrea Roschel\r', '2024-08-24 16:29:17'),
(227, 'Foto do perfil de paula.hessel\r', 'paula.hessel\r', 'paula Hessel\r', '2024-08-24 16:29:17'),
(228, 'Foto do perfil de janelanachapa\r', 'janelanachapa\r', 'Janela Na Chapa\r', '2024-08-24 16:29:17'),
(229, 'Foto do perfil de alfredoaquarone\r', 'alfredoaquarone\r', 'Alfredo Aquarone Junior\r', '2024-08-24 16:29:17'),
(230, 'Foto do perfil de fabianaamaralsilva\r', 'fabianaamaralsilva\r', '♊Faby✨🌻✨\r', '2024-08-24 16:29:17'),
(231, 'Foto do perfil de rofontellis\r', 'rofontellis\r', 'Rosangela Fontellis\r', '2024-08-24 16:29:17'),
(232, 'Foto do perfil de paulamangolin5\r', 'paulamangolin5\r', 'Paula Mangolin\r', '2024-08-24 16:29:17'),
(233, 'Foto do perfil de alexsantanah\r', 'alexsantanah\r', 'Alex Santana\r', '2024-08-24 16:29:17'),
(234, 'Foto do perfil de victorhvandrade\r', 'victorhvandrade\r', 'Victor Andrade\r', '2024-08-24 16:29:17'),
(235, 'Foto do perfil de elismarnunesdesouza10\r', 'elismarnunesdesouza10\r', 'Elismar Nunes .\r', '2024-08-24 16:29:17'),
(236, 'Foto do perfil de leticiagrisolio\r', 'leticiagrisolio\r', 'Leticia Grisolio\r', '2024-08-24 16:29:17'),
(237, 'Foto do perfil de tatianerodrigues701\r', 'tatianerodrigues701\r', 'Tatiane Rodrigues Costa\r', '2024-08-24 16:29:17'),
(238, 'Foto do perfil de adrianaalves1434\r', 'adrianaalves1434\r', 'Adriana Alves\r', '2024-08-24 16:29:17'),
(239, 'Foto do perfil de danielbeppu\r', 'danielbeppu\r', 'daniel hiroshi beppu\r', '2024-08-24 16:29:17'),
(240, 'Foto do perfil de ale_dcezar\r', 'ale_dcezar\r', 'Alessandra Cezar\r', '2024-08-24 16:29:17'),
(241, 'Foto do perfil de roberto.vitalino\r', 'roberto.vitalino\r', 'Roberto Vitalino\r', '2024-08-24 16:29:17'),
(242, 'Foto do perfil de danielfreitas.17\r', 'danielfreitas.17\r', 'Daniel Freitas\r', '2024-08-24 16:29:17'),
(243, 'Foto do perfil de alex.fssantos\r', 'alex.fssantos\r', 'Alex Fernandes\r', '2024-08-24 16:29:17'),
(244, 'Foto do perfil de eudanferraz\r', 'eudanferraz\r', 'Daniel Ferraz\r', '2024-08-24 16:29:17'),
(245, 'Foto do perfil de feh.guariniello\r', 'feh.guariniello\r', 'Feh Guariniello\r', '2024-08-24 16:29:17'),
(246, 'Foto do perfil de rizzo.rudy\r', 'rizzo.rudy\r', 'Rudy Rizzo 👨🏽‍⚕️🐈🦮🌳☀️🏝🏙🚲🎾\r', '2024-08-24 16:29:17'),
(247, 'Foto do perfil de michelicoppii\r', 'michelicoppii\r', 'Micheli Coppi\r', '2024-08-24 16:29:17'),
(248, 'Foto do perfil de rafinhadaspett\r', 'rafinhadaspett\r', 'Rafael Couventaris Daspett\r', '2024-08-24 16:29:17'),
(249, 'Foto do perfil de daisygabriel1\r', 'daisygabriel1\r', 'Daisy Silva\r', '2024-08-24 16:29:17'),
(250, 'Foto do perfil de dr.gabriel.zamora\r', 'dr.gabriel.zamora\r', 'Gabriel Zamora\r', '2024-08-24 16:29:17'),
(251, 'Foto do perfil de w_weltinho\r', 'w_weltinho\r', 'Welton Silva\r', '2024-08-24 16:29:17'),
(252, 'Foto do perfil de herbert_it\r', 'herbert_it\r', 'Herbert Valkinir\r', '2024-08-24 16:29:17'),
(253, 'Foto do perfil de julianatome\r', 'julianatome\r', 'Juliana Tomé\r', '2024-08-24 16:29:17'),
(254, 'Foto do perfil de juliamelisa.melisa.1\r', 'juliamelisa.melisa.1\r', 'Julia Gomes\r', '2024-08-24 16:29:17'),
(255, 'Foto do perfil de samantadsrodrigues\r', 'samantadsrodrigues\r', 'Samanta Rodrigues\r', '2024-08-24 16:29:17'),
(256, 'Foto do perfil de netagomespereira\r', 'netagomespereira\r', 'Neta Gomes Pereira\r', '2024-08-24 16:29:17'),
(257, 'Foto do perfil de juniorvoz\r', 'juniorvoz\r', 'Junior Voz\r', '2024-08-24 16:29:17'),
(258, 'Foto do perfil de placidoburgosneto\r', 'placidoburgosneto\r', 'Placido Burgos Neto\r', '2024-08-24 16:29:17'),
(259, 'Foto do perfil de othiagofmorais\r', 'othiagofmorais\r', 'Thiago Fernandes\r', '2024-08-24 16:29:17'),
(260, 'Foto do perfil de marianasimomura\r', 'marianasimomura\r', 'Mari Simomura\r', '2024-08-24 16:29:17'),
(261, 'Foto do perfil de alexsandropinheiroantunes\r', 'alexsandropinheiroantunes\r', 'Alex Sandro Pinheiro Antunes\r', '2024-08-24 16:29:17'),
(262, 'Foto do perfil de paty__pro\r', 'paty__pro\r', 'Patricia Goncalves\r', '2024-08-24 16:29:17'),
(263, 'Foto do perfil de jordana_ilanski\r', 'jordana_ilanski\r', 'Jordana Ilanski. 🤍\r', '2024-08-24 16:29:17'),
(264, 'Foto do perfil de sarahcomh_sena\r', 'sarahcomh_sena\r', 'Sarah Sena\r', '2024-08-24 16:29:17'),
(265, 'Foto do perfil de weslley6592\r', 'weslley6592\r', 'Weslley Ferreira\r', '2024-08-24 16:29:17'),
(266, 'Foto do perfil de alexsandro99rox\r', 'alexsandro99rox\r', 'Alexsandro Soares Martins\r', '2024-08-24 16:29:17'),
(267, 'Foto do perfil de tatasantooos_\r', 'tatasantooos_\r', 'TaTa Santos\r', '2024-08-24 16:29:17'),
(268, 'Foto do perfil de matsu.suzi21\r', 'matsu.suzi21\r', 'Suzi.matsu\r', '2024-08-24 16:29:17'),
(269, 'Foto do perfil de robsongoes1705\r', 'robsongoes1705\r', 'Robson Góes\r', '2024-08-24 16:29:17'),
(270, 'Foto do perfil de carlos_gimenez4.1\r', 'carlos_gimenez4.1\r', 'Carlos Gimenez\r', '2024-08-24 16:29:17'),
(271, 'Foto do perfil de marianef.amoriello\r', 'marianef.amoriello\r', 'Mari\r', '2024-08-24 16:29:17'),
(272, 'Foto do perfil de edu_henriique_\r', 'edu_henriique_\r', 'Eduardo Henrique\r', '2024-08-24 16:29:17'),
(273, 'Foto do perfil de fabioaguilar7134\r', 'fabioaguilar7134\r', 'Fábinho\r', '2024-08-24 16:29:17'),
(274, 'Foto do perfil de regis624\r', 'regis624\r', 'Regis Machado\r', '2024-08-24 16:29:17'),
(275, 'Foto do perfil de crissielebarros\r', 'crissielebarros\r', 'Crissiele Barros\r', '2024-08-24 16:29:17'),
(276, 'Foto do perfil de rosana_cassia\r', 'rosana_cassia\r', 'Rosana Cassia\r', '2024-08-24 16:29:17'),
(277, 'Foto do perfil de preto_sp13\r', 'preto_sp13\r', 'J Augusto\r', '2024-08-24 16:29:17'),
(278, 'Foto do perfil de damaris7101\r', 'damaris7101\r', 'Damaris Bellezi Teixeira Abrão\r', '2024-08-24 16:29:17'),
(279, 'Foto do perfil de julio.miracardoso\r', 'julio.miracardoso\r', 'Julio Cesar Mira Cardoso\r', '2024-08-24 16:29:17'),
(280, 'Foto do perfil de digodiboa\r', 'digodiboa\r', 'Digo Diboa\r', '2024-08-24 16:29:17'),
(281, 'Foto do perfil de patriciamatosdealmeida\r', 'patriciamatosdealmeida\r', 'Patricia Matos de Almeida\r', '2024-08-24 16:29:17'),
(282, 'Foto do perfil de pereira.souza.986227\r', 'pereira.souza.986227\r', 'Carlos Rafael\r', '2024-08-24 16:29:17'),
(283, 'Foto do perfil de kleber_lr\r', 'kleber_lr\r', 'Kleber Lima\r', '2024-08-24 16:29:17'),
(284, 'Foto do perfil de letobrotz\r', 'letobrotz\r', 'Julio Ferreira\r', '2024-08-24 16:29:17'),
(285, 'Foto do perfil de bruleite26\r', 'bruleite26\r', 'ᴮᴿᵁᴺᴬ ᴸᴱᴵᵀᴱ\r', '2024-08-24 16:29:17'),
(286, 'Foto do perfil de melzasf\r', 'melzasf\r', 'Elza Soufer\r', '2024-08-24 16:29:17'),
(287, 'Foto do perfil de kaique_eng\r', 'kaique_eng\r', 'Kaique Santos\r', '2024-08-24 16:29:17'),
(288, 'Foto do perfil de sammy.eduardo\r', 'sammy.eduardo\r', 'Sammy Eduardo\r', '2024-08-24 16:29:17'),
(289, 'Foto do perfil de pierre89jean\r', 'pierre89jean\r', 'Jean Pierre\r', '2024-08-24 16:29:17'),
(290, 'Foto do perfil de alexhengles\r', 'alexhengles\r', 'Alex Hengles\r', '2024-08-24 16:29:17'),
(291, 'Foto do perfil de edy.psilva\r', 'edy.psilva\r', 'Edy Edigley Silva\r', '2024-08-24 16:29:17'),
(292, 'Foto do perfil de dalilagoismotta\r', 'dalilagoismotta\r', 'Dalila Gois Motta\r', '2024-08-24 16:29:17'),
(293, 'Foto do perfil de ajskema\r', 'ajskema\r', 'Junior Queiroz\r', '2024-08-24 16:29:17'),
(294, 'Foto do perfil de dridri.mac\r', 'dridri.mac\r', 'Adriana Araujo Correia\r', '2024-08-24 16:29:17'),
(295, 'Foto do perfil de rosanasurek\r', 'rosanasurek\r', 'Rosana Surek\r', '2024-08-24 16:29:17'),
(296, 'Foto do perfil de leandrosantana2206\r', 'leandrosantana2206\r', 'Leandro Santana\r', '2024-08-24 16:29:17'),
(297, 'Foto do perfil de mag_rafa_amoriello\r', 'mag_rafa_amoriello\r', 'Mag Rafa Amoriello\r', '2024-08-24 16:29:17'),
(298, 'Foto do perfil de prof_jeffsilvacarneiroandrade\r', 'prof_jeffsilvacarneiroandrade\r', 'Prof. Je𝔣𝔣𝔢𝔯𝔰𝔬𝔫\r', '2024-08-24 16:29:17'),
(299, 'Foto do perfil de renats_82\r', 'renats_82\r', 'Renato Fernandes Medeiros\r', '2024-08-24 16:29:17'),
(300, 'Foto do perfil de dennislima1\r', 'dennislima1\r', 'Dennis Lima\r', '2024-08-24 16:29:17'),
(301, 'Foto do perfil de carvalhaiscris\r', 'carvalhaiscris\r', 'Cris Carvalhais\r', '2024-08-24 16:29:17'),
(302, 'Foto do perfil de _anapaulaa15_\r', '_anapaulaa15_\r', 'Ana Paula\r', '2024-08-24 16:29:17'),
(303, 'Foto do perfil de gustavo.fernandes.1069\r', 'gustavo.fernandes.1069\r', 'Gustavo Fernandes\r', '2024-08-24 16:29:17'),
(304, 'Foto do perfil de pattynnetto\r', 'pattynnetto\r', 'Patrícia Nunes Netto\r', '2024-08-24 16:29:17'),
(305, 'Foto do perfil de liliavieiras\r', 'liliavieiras\r', 'Lilia Vieira\r', '2024-08-24 16:29:17'),
(306, 'Foto do perfil de nando_caps\r', 'nando_caps\r', 'Fernando Augusto Fernandes\r', '2024-08-24 16:29:17'),
(307, 'Foto do perfil de fabriziostura\r', 'fabriziostura\r', 'Fabrizio Stura\r', '2024-08-24 16:29:17'),
(308, 'Foto do perfil de marcelbertani\r', 'marcelbertani\r', 'Marcel Garcia\r', '2024-08-24 16:29:17'),
(309, 'Foto do perfil de rocumbackgisele\r', 'rocumbackgisele\r', 'Gisele Rocumback\r', '2024-08-24 16:29:17'),
(310, 'Foto do perfil de bibi_ferolla\r', 'bibi_ferolla\r', 'Bianca Ferola\r', '2024-08-24 16:29:17'),
(311, 'Foto do perfil de galvao.af\r', 'galvao.af\r', 'Alexandre Galvão\r', '2024-08-24 16:29:17'),
(312, 'Foto do perfil de dinahviagens\r', 'dinahviagens\r', 'Dinah Souza\r', '2024-08-24 16:29:17'),
(313, 'Foto do perfil de ismene_mendonca\r', 'ismene_mendonca\r', 'Ismene Mendonca\r', '2024-08-24 16:29:17'),
(314, 'Foto do perfil de taticeci21\r', 'taticeci21\r', 'Tatiani Martins\r', '2024-08-24 16:29:17'),
(315, 'Foto do perfil de marimeloni\r', 'marimeloni\r', 'Mari\r', '2024-08-24 16:29:17'),
(316, 'Foto do perfil de janishelena\r', 'janishelena\r', 'Janis Helena\r', '2024-08-24 16:29:17'),
(317, 'Foto do perfil de marcelobarros.sud\r', 'marcelobarros.sud\r', 'Marcelo Barros\r', '2024-08-24 16:29:17'),
(318, 'Foto do perfil de tatianabastosaraujo\r', 'tatianabastosaraujo\r', 'Tatiana Bastos Araujo\r', '2024-08-24 16:29:17'),
(319, 'Foto do perfil de kelisousasousa\r', 'kelisousasousa\r', 'Kelly Sousa\r', '2024-08-24 16:29:17'),
(320, 'Foto do perfil de fa67queiroz\r', 'fa67queiroz\r', 'Maria de Fatima\r', '2024-08-24 16:29:17'),
(321, 'Foto do perfil de juninho_itamar\r', 'juninho_itamar\r', 'Itamar Junior\r', '2024-08-24 16:29:17'),
(322, 'Foto do perfil de vera_lopes_silva\r', 'vera_lopes_silva\r', 'Vera Lúcia\r', '2024-08-24 16:29:17'),
(323, 'Foto do perfil de bruno.truszko.panza\r', 'bruno.truszko.panza\r', 'Bruno Truszko Panza\r', '2024-08-24 16:29:17'),
(324, 'Foto do perfil de tayna_linhares\r', 'tayna_linhares\r', 'Taynã Linhares da Costa\r', '2024-08-24 16:29:17'),
(325, 'Foto do perfil de criandoarafinha\r', 'criandoarafinha\r', NULL, '2024-08-24 16:29:17'),
(326, 'Foto do perfil de ijosias\r', 'ijosias\r', 'Josias\r', '2024-08-24 16:29:17'),
(327, 'Foto do perfil de fernandamorcon\r', 'fernandamorcon\r', 'Fernanda Morcon\r', '2024-08-24 16:29:17'),
(328, 'Foto do perfil de lucas.roodrigues94\r', 'lucas.roodrigues94\r', 'Lucas Rodrigues\r', '2024-08-24 16:29:17'),
(329, 'Foto do perfil de clausilva92\r', 'clausilva92\r', 'Clau Costa\r', '2024-08-24 16:29:17'),
(330, 'Foto do perfil de e_nunes10\r', 'e_nunes10\r', 'Elismar Nunes\r', '2024-08-24 16:29:17'),
(331, 'Foto do perfil de kacristaldonascimento\r', 'kacristaldonascimento\r', 'karina\r', '2024-08-24 16:29:17'),
(332, 'Foto do perfil de ferreiramarili\r', 'ferreiramarili\r', 'Marili Ferreira\r', '2024-08-24 16:29:17'),
(333, 'Foto do perfil de fabiomma\r', 'fabiomma\r', 'Fabio Souza\r', '2024-08-24 16:29:17'),
(334, 'Foto do perfil de tabata.silvaa\r', 'tabata.silvaa\r', 'Tábata Silva\r', '2024-08-24 16:29:17'),
(335, 'Foto do perfil de vicentepereirasouza\r', 'vicentepereirasouza\r', 'Pipoka Junior\r', '2024-08-24 16:29:17'),
(336, 'Foto do perfil de andersotelles\r', 'andersotelles\r', 'Anderson Telles\r', '2024-08-24 16:29:17'),
(337, 'Foto do perfil de ju_naves\r', 'ju_naves\r', 'Jú Naves\r', '2024-08-24 16:29:17'),
(338, 'Foto do perfil de tatianez\r', 'tatianez\r', 'Tatiane Moraes Lopes\r', '2024-08-24 16:29:17'),
(339, 'Foto do perfil de _graaoliveira\r', '_graaoliveira\r', 'Graciele Oliveira\r', '2024-08-24 16:29:17'),
(340, 'Foto do perfil de thulio.jpg\r', 'thulio.jpg\r', 'Thúlio\r', '2024-08-24 16:29:17'),
(341, 'Foto do perfil de josyane_estevao\r', 'josyane_estevao\r', 'Josyane Estevão\r', '2024-08-24 16:29:17'),
(342, 'Foto do perfil de keitixavier\r', 'keitixavier\r', 'Keiti Xavier\r', '2024-08-24 16:29:17'),
(343, 'Foto do perfil de cingarcia23\r', 'cingarcia23\r', 'Cíntia Garcia\r', '2024-08-24 16:29:17'),
(344, 'Foto do perfil de mazzonifilho\r', 'mazzonifilho\r', 'Marcos Mazzoni Filho\r', '2024-08-24 16:29:17'),
(345, 'Foto do perfil de oliv_vanessa\r', 'oliv_vanessa\r', 'Vanessa Oliveira\r', '2024-08-24 16:29:17'),
(346, 'Foto do perfil de emerson.s.costa\r', 'emerson.s.costa\r', 'Emerson Costa\r', '2024-08-24 16:29:17'),
(347, 'Foto do perfil de izapaixaopinheiro\r', 'izapaixaopinheiro\r', 'Iza Paixao Pinheiro\r', '2024-08-24 16:29:17'),
(348, 'Foto do perfil de fabiolacaires\r', 'fabiolacaires\r', 'Fabiola Caires\r', '2024-08-24 16:29:17'),
(349, 'Foto do perfil de pallomamentone\r', 'pallomamentone\r', 'Palloma Mentone\r', '2024-08-24 16:29:17'),
(350, 'Foto do perfil de kianenani\r', 'kianenani\r', 'Elaine Cristina Santos\r', '2024-08-24 16:29:17'),
(351, 'Foto do perfil de william.romao.372\r', 'william.romao.372\r', 'William Romão\r', '2024-08-24 16:29:17'),
(352, 'Foto do perfil de liviaafgueiredo\r', 'liviaafgueiredo\r', 'Lívia Alves de Figueiredo\r', '2024-08-24 16:29:17'),
(353, 'Foto do perfil de vivicpradoo\r', 'vivicpradoo\r', 'Vivi Santos Prado\r', '2024-08-24 16:29:17'),
(354, 'Foto do perfil de tartalk\r', 'tartalk\r', 'Flavia Tartareli Mendes\r', '2024-08-24 16:29:17'),
(355, 'Foto do perfil de silva_marcos35\r', 'silva_marcos35\r', 'marcos silva\r', '2024-08-24 16:29:17'),
(356, 'Foto do perfil de jonathann_design\r', 'jonathann_design\r', 'Jonathan Design\r', '2024-08-24 16:29:17'),
(357, 'Foto do perfil de martaarcar\r', 'martaarcar\r', 'MarthaCarvalho\r', '2024-08-24 16:29:17'),
(358, 'Foto do perfil de uilmacarlade\r', 'uilmacarlade\r', 'Uilma Oliveira Souza Oliveira\r', '2024-08-24 16:29:17'),
(359, 'Foto do perfil de elizabete2386\r', 'elizabete2386\r', 'Elizabete Abreu\r', '2024-08-24 16:29:17'),
(360, 'Foto do perfil de woliveira978\r', 'woliveira978\r', 'Wellington Oliveira Martins\r', '2024-08-24 16:29:17'),
(361, 'Foto do perfil de nanda_____reis\r', 'nanda_____reis\r', 'Fernanda\r', '2024-08-24 16:29:17'),
(362, 'Foto do perfil de pacheco_gsp\r', 'pacheco_gsp\r', 'Gustavo Pacheco\r', '2024-08-24 16:29:17'),
(363, 'Foto do perfil de roschunck\r', 'roschunck\r', 'Rosana Schunck\r', '2024-08-24 16:29:17'),
(364, 'Foto do perfil de everton8296\r', 'everton8296\r', 'Rebraever Teixeira\r', '2024-08-24 16:29:17'),
(365, 'Foto do perfil de fa67queirozz\r', 'fa67queirozz\r', 'Fátima Queiroz\r', '2024-08-24 16:29:17'),
(366, 'Foto do perfil de regianesantos_silva\r', 'regianesantos_silva\r', 'Regiane Santos\r', '2024-08-24 16:29:17'),
(367, 'Foto do perfil de christeroschel\r', 'christeroschel\r', 'José Carlos Christe Roschel\r', '2024-08-24 16:29:17'),
(368, 'Foto do perfil de taisferreiradeoliveira\r', 'taisferreiradeoliveira\r', 'Taís Ferreira de Oliveira\r', '2024-08-24 16:29:17'),
(369, 'Foto do perfil de fabs.inl\r', 'fabs.inl\r', 'Fabiola Fabs\r', '2024-08-24 16:29:17'),
(370, 'Foto do perfil de cassiapsf\r', 'cassiapsf\r', 'Cássia Pinheiro\r', '2024-08-24 16:29:17'),
(371, 'Foto do perfil de valquiriaceliasouza\r', 'valquiriaceliasouza\r', 'Valquiria Célia Souza\r', '2024-08-24 16:29:17'),
(372, 'Foto do perfil de lua_oliver30\r', 'lua_oliver30\r', 'Luana Oliveira🌻\r', '2024-08-24 16:29:17'),
(373, 'Foto do perfil de nathbt\r', 'nathbt\r', 'Nath Bernardes Teixeira\r', '2024-08-24 16:29:17'),
(374, 'Foto do perfil de geisa.amarals\r', 'geisa.amarals\r', 'Geisa Amaral\r', '2024-08-24 16:29:17'),
(375, 'Foto do perfil de jacke0312\r', 'jacke0312\r', 'Jaque Almeida\r', '2024-08-24 16:29:17'),
(376, 'Foto do perfil de claudio.mauriciomorato\r', 'claudio.mauriciomorato\r', 'Claudio Maurício Morato Filosofia/Biologia Coordenador\r', '2024-08-24 16:29:17'),
(377, 'Foto do perfil de andre.l.c.sousa\r', 'andre.l.c.sousa\r', 'Andre Sousa\r', '2024-08-24 16:29:17'),
(378, 'Foto do perfil de reflitame\r', 'reflitame\r', 'Reflita-me\r', '2024-08-24 16:29:17'),
(379, 'Foto do perfil de elaine.surreal\r', 'elaine.surreal\r', 'Elaine Oliveira\r', '2024-08-24 16:29:17'),
(380, 'Foto do perfil de andreia.oliveiradossantos.7\r', 'andreia.oliveiradossantos.7\r', 'Andréia Oliveira Dedéia\r', '2024-08-24 16:29:17'),
(381, 'Foto do perfil de edney9834\r', 'edney9834\r', 'Edney Silva\r', '2024-08-24 16:29:17'),
(382, 'Foto do perfil de claytonsousa8\r', 'claytonsousa8', NULL, '2024-08-24 16:29:17'),
(383, 'Foto de Perfil de jn.reformass', 'jn.reformass', '𝔍𝔫 ℜ𝔢𝔣𝔬𝔯𝔪𝔞𝔰', '2024-08-24 16:29:17'),
(384, NULL, 'wssomeluz.wsespelhados17', NULL, '2024-08-24 16:29:17'),
(385, NULL, 'amorielloluiz', NULL, '2024-08-24 16:29:17'),
(386, NULL, 'shoriconsultorimobiliario', NULL, '2024-08-24 16:29:17'),
(387, NULL, 'rgfontes', NULL, '2024-08-24 16:29:17'),
(388, NULL, 'galvaoimagem', NULL, '2024-08-24 16:29:17'),
(389, NULL, 'paty.cleinsantos', NULL, '2024-08-24 16:29:17'),
(390, NULL, 'marcel.scarpim', NULL, '2024-08-24 16:29:17'),
(391, NULL, '_priribeirooo', NULL, '2024-08-24 16:29:17'),
(392, NULL, 'anacris_arteira', NULL, '2024-08-24 16:29:17'),
(393, NULL, 'daflor_vidasaudavel', NULL, '2024-08-24 16:29:17'),
(394, NULL, 'alexpachecoproducao', NULL, '2024-08-24 16:29:17'),
(395, NULL, 'william.mountain', NULL, '2024-08-24 16:29:17'),
(396, NULL, 'rosebailaroficial', NULL, '2024-08-24 16:29:17'),
(397, NULL, 'orunior', NULL, '2024-08-24 16:29:17'),
(398, NULL, 'rodrigo_negrao_painter', NULL, '2024-08-24 16:29:17'),
(399, NULL, 'pinheiroantunesalexsandro', NULL, '2024-08-24 16:29:17'),
(400, NULL, 'monavarrette22', NULL, '2024-08-24 16:29:17'),
(401, NULL, 'n_zterapias', NULL, '2024-08-24 16:29:17'),
(402, NULL, 'fernando_lima7865', NULL, '2024-08-24 16:29:17'),
(403, NULL, 'gefferson.teixeira.5', NULL, '2024-08-24 16:29:17'),
(404, NULL, 'alessandro_rubens', NULL, '2024-08-24 16:29:17'),
(405, NULL, 'luca_ferreira.bass', NULL, '2024-08-24 16:29:17'),
(406, NULL, 'zenildeslimaderi', NULL, '2024-08-24 16:29:17'),
(407, NULL, 'rafaelalves6014', NULL, '2024-08-24 16:29:17'),
(408, NULL, '\r\nlucianadiascavalcante\r\n', NULL, '2024-08-24 16:29:17'),
(409, NULL, '\r\nalexandreferreiracordeiro\r\n', NULL, '2024-08-24 16:29:17'),
(410, NULL, '\r\nthiagojsab\r\n', NULL, '2024-08-24 16:29:17'),
(411, NULL, '\r\npauloh_basilio\r\n', NULL, '2024-08-24 16:29:17'),
(412, NULL, '\r\nigor.duarte\r\n', NULL, '2024-08-24 16:29:17'),
(413, NULL, '\r\nfia.mariaviana\r\n', NULL, '2024-08-24 16:29:17'),
(414, NULL, '\r\nkatiacristinapaulon\r\n', NULL, '2024-08-24 16:29:17'),
(415, NULL, '\r\nmatos_.patricia\r\n', NULL, '2024-08-24 16:29:17'),
(416, NULL, '\r\njosueasena\r\n', NULL, '2024-08-24 16:29:17'),
(417, NULL, '\r\nsoudiegoguerra\r\n', NULL, '2024-08-24 16:29:17'),
(418, NULL, '\r\nkellijuliane\r\n', NULL, '2024-08-24 16:29:17'),
(419, NULL, '\r\ndrikinha4.1\r\n', NULL, '2024-08-24 16:29:17'),
(420, NULL, '\r\ndrgabrielzamora\r\n', NULL, '2024-08-24 16:29:17'),
(421, NULL, '\r\nrullylima\r\n', NULL, '2024-08-24 16:29:17'),
(422, NULL, '\r\nnildacristinadelimasilva\r\n', NULL, '2024-08-24 16:29:17'),
(423, NULL, '\r\n26juntos\r\n', NULL, '2024-08-24 16:29:17'),
(424, NULL, '\r\nvianasroy\r\n', NULL, '2024-08-24 16:29:17'),
(425, NULL, '\r\nmeymeynegagata\r\n', NULL, '2024-08-24 16:29:17'),
(426, NULL, '\r\npthiagosilva\r\n', NULL, '2024-08-24 16:29:17'),
(427, NULL, '\r\nlenilsonidalino\r\n', NULL, '2024-08-24 16:29:17'),
(428, NULL, '\r\nmanoseve_3\r\n', NULL, '2024-08-24 16:29:17'),
(429, NULL, '\r\nnessa16bueno\r\n', NULL, '2024-08-24 16:29:17'),
(430, NULL, '\r\nfabiomarsil1979\r\n', NULL, '2024-08-24 16:29:17'),
(431, NULL, '\r\nvitor.aduarte\r\n', NULL, '2024-08-24 16:29:17'),
(432, NULL, '\r\njhonnyjb26\r\n', NULL, '2024-08-24 16:29:17'),
(433, NULL, '\r\nsandrar.laurentino\r\n', NULL, '2024-08-24 16:29:17'),
(434, NULL, '\r\nanaleoneli\r\n', NULL, '2024-08-24 16:29:17'),
(435, NULL, 'gerlach_magda', NULL, '2024-10-20 19:42:43'),
(436, NULL, 'diva.rodrigues.921', NULL, '2024-10-20 19:44:09'),
(437, NULL, 'eliaspaixaopinheiropaixao', NULL, '2024-10-20 19:44:09'),
(438, NULL, 'palazzieduardo', NULL, '2024-10-20 19:44:09'),
(439, NULL, 'roreis_treinador', NULL, '2024-10-20 19:44:09'),
(440, NULL, '_ivone_limaa', NULL, '2024-10-20 19:44:09'),
(441, NULL, 'lucianolemos520', NULL, '2024-10-20 19:44:09'),
(442, NULL, 'santow10', NULL, '2024-10-20 19:44:09'),
(443, NULL, 'leofranzin', NULL, '2024-10-20 19:44:09'),
(444, NULL, 'foaraujo', NULL, '2024-10-20 19:44:09'),
(445, NULL, 'wesleypellegrini', NULL, '2024-10-20 19:44:09'),
(446, NULL, 'tesourotentacao', NULL, '2024-10-20 19:44:09'),
(447, NULL, 'elianafagundes11', NULL, '2024-10-20 19:44:09'),
(448, NULL, 'danielle_lourooo', NULL, '2024-10-20 19:44:09'),
(449, NULL, 'f.fronza', NULL, '2024-10-20 19:44:09'),
(450, NULL, 'elinarimatsunutri', NULL, '2024-10-20 19:44:09'),
(451, NULL, 'paulohbasilio', NULL, '2024-10-20 19:44:09'),
(452, NULL, 'nf.andrade2012', NULL, '2024-10-20 19:44:09'),
(453, NULL, 'marcio_spaiva', NULL, '2024-10-20 19:44:09'),
(454, NULL, 'marcelogaudioso', NULL, '2024-10-20 19:44:09'),
(455, NULL, 'carladecastrosouza', NULL, '2024-10-20 19:44:09'),
(456, NULL, 'bruno.gig', NULL, '2024-10-20 19:44:09'),
(457, NULL, 'camiscosta11', NULL, '2024-10-20 19:44:09'),
(458, NULL, 'aana.carolyne', NULL, '2024-10-20 19:44:09'),
(459, NULL, 'ascenciorona', NULL, '2024-10-20 19:44:09'),
(460, NULL, 'josiasmelquides', NULL, '2024-10-20 19:44:09'),
(461, NULL, 'claytonsullivan_papel', NULL, '2024-10-20 19:44:09'),
(462, NULL, 'brunoramoss_90', NULL, '2024-10-20 19:44:09'),
(463, NULL, 'victorvizoso', NULL, '2024-10-20 19:44:09'),
(464, NULL, 'margareth_o_santos', NULL, '2024-10-20 19:44:09'),
(465, NULL, 'zecafalcantara', NULL, '2024-10-20 19:44:09'),
(466, NULL, 'vanusa77alves', NULL, '2024-10-20 19:44:09'),
(467, NULL, 'le.mateus.g', NULL, '2024-10-20 19:44:09'),
(468, NULL, 'leticialaisdossan', NULL, '2024-10-20 19:44:09'),
(469, NULL, 'pereiracarlinhoshenrique', NULL, '2024-10-20 19:44:09'),
(470, NULL, 'wcp.william', NULL, '2024-10-20 19:44:09'),
(471, NULL, 'gabebuss', NULL, '2024-10-20 19:44:09'),
(472, NULL, 'adriana.dourado.735507', NULL, '2024-10-20 19:44:09'),
(473, NULL, 'pedro_pedrada_', NULL, '2024-10-20 19:44:09'),
(474, NULL, 'diegovitorcs', NULL, '2024-10-20 19:44:09'),
(475, NULL, 'mara.gomes.3954', NULL, '2024-10-20 19:44:09'),
(476, NULL, 'domjones62', NULL, '2024-10-20 19:44:09'),
(477, NULL, 'daniel_lisboa', NULL, '2024-10-20 19:44:09'),
(478, NULL, 'rafaelsp01', NULL, '2024-10-20 19:44:09'),
(479, NULL, 'danielaspigariol', NULL, '2024-10-20 19:44:09'),
(480, NULL, 'mcveinho__', NULL, '2024-11-07 00:43:10'),
(481, NULL, 'ohlifrocha', NULL, '2024-11-07 00:43:10'),
(482, NULL, 'joao.santana79', NULL, '2024-11-07 00:43:10'),
(483, NULL, 'gabrielgezarano', NULL, '2024-11-07 00:43:10'),
(484, NULL, '_jacksonbenetti', NULL, '2024-11-07 00:43:10'),
(485, NULL, 'lupisaneschi', NULL, '2024-11-07 00:43:10'),
(486, NULL, 'aleteixeira08', NULL, '2024-11-07 00:43:10'),
(487, NULL, 'dennis.goncalvesoliveira', NULL, '2024-11-07 00:43:10'),
(488, NULL, 'andredorizotti.adv', NULL, '2024-11-07 00:43:10'),
(489, NULL, 'susileifreitas', NULL, '2024-11-07 00:43:10'),
(490, NULL, 'dan_goodvibes', NULL, '2024-11-07 00:43:10'),
(491, NULL, 'vangues2209', NULL, '2024-11-07 00:43:10'),
(492, NULL, 'tamaragbarbos', NULL, '2024-11-07 00:43:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `expira_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`id`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Sócio'),
(3, 'Operador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_usuario_id` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `criado_em`, `tipo_usuario_id`, `ativo`) VALUES
(1, 'Fernando Queiroz Acquesta', 'facquesta5@hotmail.com', '$2y$10$t1Cf7FVfhcoMKIAxLPQnvOkFmSbRSxs9JW/.rRvVEG.rY.eALgcj.', '2024-05-14 14:12:52', 1, 1),
(2, 'Romer Simpsons', 'romer.simpsons@hotmail.com', '$2y$10$SsSv4Zsg8w5dLwu0fRYgN.JbuXHGQ/ludUEIf4DXVWWhh9YbMOLfm', '2024-05-14 14:13:47', 3, 2),
(3, 'geronimo', 'gera@gmail.com', '$2y$10$fKxT7dIhOQMxnKeXYLZEcecXxjZkt4P1U7K6WSEgst1LzrsrPJiBq', '2024-05-14 16:00:19', 3, 1),
(4, 'geronimo', 'g@gmail.com', '$2y$10$bZ6hmcvSSqM2R3KNwEWMV.vCHkVUVjpZr4UeNG5O3CTZFkdPLkpVi', '2024-05-14 16:00:32', 3, 1),
(5, 'OnlinePoket', 'online@gmail.com', '$2y$10$DORikxUWkAeUYcmmm5H/7OyZNz4cG03KF0ZSq11HLD4Z4THrz.WUC', '2024-05-14 16:05:33', 3, 1),
(7, 'Giovana', 'gi@hotmail.com', '$2y$10$ajCtTHxHF1sRmtkZ7XvbROZQc/fUJwcXXIlB2iFWIVdKXFOHdpC9q', '2024-05-14 16:08:06', 3, 1),
(10, 'Otavio', 'otavio@gmail.com', '$2y$10$g3IdnvP335tn1cBmHQI.juFoKIKxZci2t9vpc0D7FnGLgwBQDBTAy', '2024-05-14 16:13:35', 3, 1),
(15, 'RODOX', 'rodolfinho@gmail.cpom', '$2y$10$99hFOkV0Cavf.lAYsKlcn./LwYo.K6NH60fcojSldB5SixGw41NDS', '2024-05-20 19:48:34', 3, 1),
(16, 'Juninho Play', 'juninho@gmail.com', '$2y$10$jpH/y0.ccvGC7OF26R9gDOn3hcEDs/8c7k1jFlcy1/INE1uHKUjdG', '2024-05-20 20:00:07', 3, 1),
(17, 'Fernando Queiroz Acquesta', 'facquesta5@gmail.com', '$2y$10$odVp/rqL1svkvupOylH5/usyoqywPg316tEOs/T2fzyolX1GG2mYO', '2024-05-23 22:42:14', 1, 1),
(18, 'Jurandir', 'jurandir@gmail.com', '$2y$10$rU6TuLQrMLx8tmfbKss4XORV7iLp4iXYx.jBMUcvthHI9NDjflFE2', '2024-05-24 01:43:09', 3, 1),
(19, 'gomes', 'gomes@gmail.com', '$2y$10$iIGzZsNtdgBxZiekk3kRNuBUmWHkSSztsTDZtUWIQHmQycg4mU9Je', '2024-05-24 01:45:28', 2, 1),
(20, 'Robgol', 'robgol@gmail.com', '$2y$10$zSJsI5OArO/aV54fYTHbQes8iM7q9UJWI3Bh0Hj9xX2WrBDiWEniq', '2024-06-16 20:14:30', 2, 1),
(21, 'Rodolfogol', 'rodolfogol@gmail.com', '$2y$10$PwGZL4.3yNWaEH0woNsEbuKw8Rj3cV9I/orieG3OuH9b3hQk0zSm.', '2024-06-16 20:20:19', 2, 1),
(22, 'fodolfogol', 'fodolfogol@gmail.com', '$2y$10$dSY/lXAVApmToFi1Pfrj0OMMCMgonWc6nIB1X1Vdx8N/UXucUVbf2', '2024-06-16 20:22:33', 2, 1),
(23, 'Tchonho', 'tchonho@gmail.com', '$2y$10$b1hcsuzpEPTmxtRgb3hCc.FliAqMECJpObtqxY3ZT0sts8eEKDoia', '2024-06-16 20:33:46', 2, 1),
(24, 'zuzu', 'zuzu@gmail.com', '$2y$10$MDTRSYAwp/VK7f/XVRI3heaVRi38knRu0rPhd/U/IzRgKNc2lEuae', '2024-06-16 21:02:47', 2, 1),
(26, 'Novo usuário', 'novo_usuario@gmail.com', '$2y$10$Mcn0gUs5diqK9dBiMCuPyuupK7Sg8532oRPX9UKwpLEpy1N7eOvUu', '2024-08-11 21:03:49', 1, 1),
(28, 'Juvenitus', 'juvenitus@gmail.com', '$2y$10$J3fAN97ivZseXGs0mJXwXOVh9iBYC1/cO2W49dhwNHB//OBtki506', '2024-08-11 21:34:27', 2, 1),
(29, 'qwe', 'qwe@gmail.com', '$2y$10$Hjb/xcmBNtALsBb8KX0FLOvMQRJsL1.gnfeGF.x4AET/aFiZRzHkq', '2024-08-11 22:13:43', 1, 1),
(30, '123', 'ti@abrava.com.br', '$2y$10$mXs3hFWNKw2CQqD/yBuXgemHjExQ/cMCzVoXHpiIasRH2P8UNq3wu', '2024-09-11 00:55:33', 1, 1),
(32, '123', 'ti@abrasdfa.com.br', '$2y$10$ibpRA7dbMoUTb3ZVkBbltOQGXvcQuaB3plwxCrqhO5nhsLzxaU9E6', '2024-09-11 00:56:42', 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `monitorar_perfis`
--
ALTER TABLE `monitorar_perfis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `usuarios_ibfk_1` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carros`
--
ALTER TABLE `carros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `monitorar_perfis`
--
ALTER TABLE `monitorar_perfis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `sessoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipos_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

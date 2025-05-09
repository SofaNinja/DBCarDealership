PGDMP  1                     }            CarDealership    17.0    17.0 v    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    CarDealership    DATABASE     �   CREATE DATABASE "CarDealership" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "CarDealership";
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16389    additional_options    TABLE     �   CREATE TABLE public.additional_options (
    additional_option_id integer NOT NULL,
    name character varying(100) NOT NULL,
    option_price numeric(10,2) NOT NULL
);
 &   DROP TABLE public.additional_options;
       public         heap r       postgres    false    4            �            1259    16392 +   additional_options_additional_option_id_seq    SEQUENCE     �   CREATE SEQUENCE public.additional_options_additional_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.additional_options_additional_option_id_seq;
       public               postgres    false    217    4            �           0    0 +   additional_options_additional_option_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.additional_options_additional_option_id_seq OWNED BY public.additional_options.additional_option_id;
          public               postgres    false    218            �            1259    16393    additional_options_order    TABLE     �   CREATE TABLE public.additional_options_order (
    order_id integer,
    additional_option_id integer,
    id integer NOT NULL
);
 ,   DROP TABLE public.additional_options_order;
       public         heap r       postgres    false    4            �            1259    16396    additional_options_order_id_seq    SEQUENCE     �   ALTER TABLE public.additional_options_order ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.additional_options_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    219    4            �            1259    16397    applications    TABLE     �   CREATE TABLE public.applications (
    application_id integer NOT NULL,
    creation_date date NOT NULL,
    completion_date date NOT NULL,
    order_id integer NOT NULL,
    order_status_id integer,
    car_id integer,
    manager_id integer
);
     DROP TABLE public.applications;
       public         heap r       postgres    false    4            �            1259    16400    applications_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.applications_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.applications_application_id_seq;
       public               postgres    false    4    221            �           0    0    applications_application_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.applications_application_id_seq OWNED BY public.applications.application_id;
          public               postgres    false    222            �            1259    16401 
   body_types    TABLE     p   CREATE TABLE public.body_types (
    body_type_id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.body_types;
       public         heap r       postgres    false    4            �            1259    16404    body_types_body_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.body_types_body_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.body_types_body_type_id_seq;
       public               postgres    false    223    4            �           0    0    body_types_body_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.body_types_body_type_id_seq OWNED BY public.body_types.body_type_id;
          public               postgres    false    224            �            1259    16405    car_fuel_types    TABLE     n   CREATE TABLE public.car_fuel_types (
    car_id integer,
    fuel_type_id integer,
    id integer NOT NULL
);
 "   DROP TABLE public.car_fuel_types;
       public         heap r       postgres    false    4            �            1259    16408    car_fuel_types_id_seq    SEQUENCE     �   ALTER TABLE public.car_fuel_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.car_fuel_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    225            �            1259    16409    cars    TABLE     '  CREATE TABLE public.cars (
    car_id integer NOT NULL,
    model character varying(100) NOT NULL,
    year integer NOT NULL,
    price numeric(10,2) NOT NULL,
    body_type_id integer NOT NULL,
    transmission_type_id integer NOT NULL,
    drive_type_id integer NOT NULL,
    number_of_doors integer NOT NULL,
    capacity integer NOT NULL,
    dimensions character varying(100) NOT NULL,
    wheelbase character varying(100) NOT NULL,
    max_torque numeric(10,2) NOT NULL,
    engine_volume numeric(10,2) NOT NULL,
    power numeric(10,2) NOT NULL,
    weight numeric(10,2) NOT NULL,
    clearance numeric(10,2) NOT NULL,
    load_capacity numeric(10,2) NOT NULL,
    trunk_volume numeric(10,2) NOT NULL,
    color character varying(50) NOT NULL,
    image text DEFAULT '/default.png'::text NOT NULL
);
    DROP TABLE public.cars;
       public         heap r       postgres    false    4            �            1259    16415    cars_car_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cars_car_id_seq;
       public               postgres    false    4    227            �           0    0    cars_car_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars.car_id;
          public               postgres    false    228            �            1259    16416    cars_car_id_seq1    SEQUENCE     �   ALTER TABLE public.cars ALTER COLUMN car_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cars_car_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    227            �            1259    16417    clients    TABLE       CREATE TABLE public.clients (
    client_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    passport_number character varying(20) NOT NULL,
    identification_code character varying(20) NOT NULL,
    driver_license_number character varying(20) NOT NULL,
    password text DEFAULT 'USER'::text NOT NULL,
    authority text DEFAULT 'USER'::text NOT NULL
);
    DROP TABLE public.clients;
       public         heap r       postgres    false    4            �            1259    16424    clients_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_client_id_seq;
       public               postgres    false    4    230            �           0    0    clients_client_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;
          public               postgres    false    231            �            1259    16425    drive_types    TABLE     r   CREATE TABLE public.drive_types (
    drive_type_id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.drive_types;
       public         heap r       postgres    false    4            �            1259    16428    drive_types_drive_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.drive_types_drive_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.drive_types_drive_type_id_seq;
       public               postgres    false    232    4            �           0    0    drive_types_drive_type_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.drive_types_drive_type_id_seq OWNED BY public.drive_types.drive_type_id;
          public               postgres    false    233            �            1259    16429 
   fuel_types    TABLE     p   CREATE TABLE public.fuel_types (
    fuel_type_id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.fuel_types;
       public         heap r       postgres    false    4            �            1259    16432    fuel_types_fuel_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fuel_types_fuel_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.fuel_types_fuel_type_id_seq;
       public               postgres    false    234    4            �           0    0    fuel_types_fuel_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.fuel_types_fuel_type_id_seq OWNED BY public.fuel_types.fuel_type_id;
          public               postgres    false    235            �            1259    16433    managers    TABLE     �  CREATE TABLE public.managers (
    manager_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    passport_number character varying(20) NOT NULL,
    password text DEFAULT '$2a$12$RGBl4blaSBIv9GdkdqEHz.gWlGrKrxPE9v.p0lm.qyFUhDYO2dezC'::text NOT NULL,
    authority text DEFAULT 'MANAGER'::text NOT NULL
);
    DROP TABLE public.managers;
       public         heap r       postgres    false    4            �            1259    16440    managers_manager_id_seq    SEQUENCE     �   CREATE SEQUENCE public.managers_manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.managers_manager_id_seq;
       public               postgres    false    4    236            �           0    0    managers_manager_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.managers_manager_id_seq OWNED BY public.managers.manager_id;
          public               postgres    false    237            �            1259    16441 	   order_car    TABLE     e   CREATE TABLE public.order_car (
    order_id integer,
    car_id integer,
    id integer NOT NULL
);
    DROP TABLE public.order_car;
       public         heap r       postgres    false    4            �            1259    16444    order_car_id_seq    SEQUENCE     �   ALTER TABLE public.order_car ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    238    4            �            1259    16445    order_status    TABLE     v   CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    status character varying(20) NOT NULL
);
     DROP TABLE public.order_status;
       public         heap r       postgres    false    4            �            1259    16448     order_status_order_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.order_status_order_status_id_seq;
       public               postgres    false    240    4            �           0    0     order_status_order_status_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;
          public               postgres    false    241            �            1259    16449    orders    TABLE     �   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    client_id integer NOT NULL,
    manager_id integer NOT NULL,
    order_status_id integer,
    price numeric(10,2),
    date date DEFAULT now() NOT NULL
);
    DROP TABLE public.orders;
       public         heap r       postgres    false    4            �            1259    16453    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public               postgres    false    242    4            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public               postgres    false    243            �            1259    16454    transmission_types    TABLE     �   CREATE TABLE public.transmission_types (
    transmission_type_id integer NOT NULL,
    name character varying(100) NOT NULL
);
 &   DROP TABLE public.transmission_types;
       public         heap r       postgres    false    4            �            1259    16457 +   transmission_types_transmission_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transmission_types_transmission_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.transmission_types_transmission_type_id_seq;
       public               postgres    false    4    244            �           0    0 +   transmission_types_transmission_type_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.transmission_types_transmission_type_id_seq OWNED BY public.transmission_types.transmission_type_id;
          public               postgres    false    245            �           2604    16458 '   additional_options additional_option_id    DEFAULT     �   ALTER TABLE ONLY public.additional_options ALTER COLUMN additional_option_id SET DEFAULT nextval('public.additional_options_additional_option_id_seq'::regclass);
 V   ALTER TABLE public.additional_options ALTER COLUMN additional_option_id DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16459    applications application_id    DEFAULT     �   ALTER TABLE ONLY public.applications ALTER COLUMN application_id SET DEFAULT nextval('public.applications_application_id_seq'::regclass);
 J   ALTER TABLE public.applications ALTER COLUMN application_id DROP DEFAULT;
       public               postgres    false    222    221            �           2604    16460    body_types body_type_id    DEFAULT     �   ALTER TABLE ONLY public.body_types ALTER COLUMN body_type_id SET DEFAULT nextval('public.body_types_body_type_id_seq'::regclass);
 F   ALTER TABLE public.body_types ALTER COLUMN body_type_id DROP DEFAULT;
       public               postgres    false    224    223            �           2604    16461    clients client_id    DEFAULT     v   ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);
 @   ALTER TABLE public.clients ALTER COLUMN client_id DROP DEFAULT;
       public               postgres    false    231    230            �           2604    16462    drive_types drive_type_id    DEFAULT     �   ALTER TABLE ONLY public.drive_types ALTER COLUMN drive_type_id SET DEFAULT nextval('public.drive_types_drive_type_id_seq'::regclass);
 H   ALTER TABLE public.drive_types ALTER COLUMN drive_type_id DROP DEFAULT;
       public               postgres    false    233    232            �           2604    16463    fuel_types fuel_type_id    DEFAULT     �   ALTER TABLE ONLY public.fuel_types ALTER COLUMN fuel_type_id SET DEFAULT nextval('public.fuel_types_fuel_type_id_seq'::regclass);
 F   ALTER TABLE public.fuel_types ALTER COLUMN fuel_type_id DROP DEFAULT;
       public               postgres    false    235    234            �           2604    16464    managers manager_id    DEFAULT     z   ALTER TABLE ONLY public.managers ALTER COLUMN manager_id SET DEFAULT nextval('public.managers_manager_id_seq'::regclass);
 B   ALTER TABLE public.managers ALTER COLUMN manager_id DROP DEFAULT;
       public               postgres    false    237    236            �           2604    16465    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public               postgres    false    241    240            �           2604    16466    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    243    242            �           2604    16467 '   transmission_types transmission_type_id    DEFAULT     �   ALTER TABLE ONLY public.transmission_types ALTER COLUMN transmission_type_id SET DEFAULT nextval('public.transmission_types_transmission_type_id_seq'::regclass);
 V   ALTER TABLE public.transmission_types ALTER COLUMN transmission_type_id DROP DEFAULT;
       public               postgres    false    245    244            i          0    16389    additional_options 
   TABLE DATA                 public               postgres    false    217   l�       k          0    16393    additional_options_order 
   TABLE DATA                 public               postgres    false    219   $�       m          0    16397    applications 
   TABLE DATA                 public               postgres    false    221   �       o          0    16401 
   body_types 
   TABLE DATA                 public               postgres    false    223   ��       q          0    16405    car_fuel_types 
   TABLE DATA                 public               postgres    false    225   �       s          0    16409    cars 
   TABLE DATA                 public               postgres    false    227   ��       v          0    16417    clients 
   TABLE DATA                 public               postgres    false    230   C�       x          0    16425    drive_types 
   TABLE DATA                 public               postgres    false    232   �       z          0    16429 
   fuel_types 
   TABLE DATA                 public               postgres    false    234   k�       |          0    16433    managers 
   TABLE DATA                 public               postgres    false    236   �       ~          0    16441 	   order_car 
   TABLE DATA                 public               postgres    false    238   ��       �          0    16445    order_status 
   TABLE DATA                 public               postgres    false    240   �       �          0    16449    orders 
   TABLE DATA                 public               postgres    false    242   k�       �          0    16454    transmission_types 
   TABLE DATA                 public               postgres    false    244   �       �           0    0 +   additional_options_additional_option_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.additional_options_additional_option_id_seq', 20, true);
          public               postgres    false    218            �           0    0    additional_options_order_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.additional_options_order_id_seq', 44, true);
          public               postgres    false    220            �           0    0    applications_application_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.applications_application_id_seq', 10, true);
          public               postgres    false    222            �           0    0    body_types_body_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.body_types_body_type_id_seq', 30, true);
          public               postgres    false    224            �           0    0    car_fuel_types_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.car_fuel_types_id_seq', 19, true);
          public               postgres    false    226            �           0    0    cars_car_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cars_car_id_seq', 30, true);
          public               postgres    false    228            �           0    0    cars_car_id_seq1    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cars_car_id_seq1', 12, true);
          public               postgres    false    229            �           0    0    clients_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.clients_client_id_seq', 5, true);
          public               postgres    false    231            �           0    0    drive_types_drive_type_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.drive_types_drive_type_id_seq', 20, true);
          public               postgres    false    233            �           0    0    fuel_types_fuel_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.fuel_types_fuel_type_id_seq', 25, true);
          public               postgres    false    235            �           0    0    managers_manager_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.managers_manager_id_seq', 41, true);
          public               postgres    false    237            �           0    0    order_car_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.order_car_id_seq', 22, true);
          public               postgres    false    239            �           0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 9, true);
          public               postgres    false    241            �           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 83, true);
          public               postgres    false    243            �           0    0 +   transmission_types_transmission_type_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.transmission_types_transmission_type_id_seq', 20, true);
          public               postgres    false    245            �           2606    16469 6   additional_options_order additional_options_order_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.additional_options_order
    ADD CONSTRAINT additional_options_order_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.additional_options_order DROP CONSTRAINT additional_options_order_pkey;
       public                 postgres    false    219            �           2606    16471 *   additional_options additional_options_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.additional_options
    ADD CONSTRAINT additional_options_pkey PRIMARY KEY (additional_option_id);
 T   ALTER TABLE ONLY public.additional_options DROP CONSTRAINT additional_options_pkey;
       public                 postgres    false    217            �           2606    16473    applications applications_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (application_id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public                 postgres    false    221            �           2606    16475    body_types body_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.body_types
    ADD CONSTRAINT body_types_pkey PRIMARY KEY (body_type_id);
 D   ALTER TABLE ONLY public.body_types DROP CONSTRAINT body_types_pkey;
       public                 postgres    false    223            �           2606    16477 "   car_fuel_types car_fuel_types_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.car_fuel_types
    ADD CONSTRAINT car_fuel_types_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.car_fuel_types DROP CONSTRAINT car_fuel_types_pkey;
       public                 postgres    false    225            �           2606    16479    cars cars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public                 postgres    false    227            �           2606    16481    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public                 postgres    false    230            �           2606    16483    drive_types drive_types_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.drive_types
    ADD CONSTRAINT drive_types_pkey PRIMARY KEY (drive_type_id);
 F   ALTER TABLE ONLY public.drive_types DROP CONSTRAINT drive_types_pkey;
       public                 postgres    false    232            �           2606    16485    fuel_types fuel_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.fuel_types
    ADD CONSTRAINT fuel_types_pkey PRIMARY KEY (fuel_type_id);
 D   ALTER TABLE ONLY public.fuel_types DROP CONSTRAINT fuel_types_pkey;
       public                 postgres    false    234            �           2606    16487    managers managers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (manager_id);
 @   ALTER TABLE ONLY public.managers DROP CONSTRAINT managers_pkey;
       public                 postgres    false    236            �           2606    16489    order_car order_car_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.order_car
    ADD CONSTRAINT order_car_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.order_car DROP CONSTRAINT order_car_pkey;
       public                 postgres    false    238            �           2606    16491    order_status order_status_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public                 postgres    false    240            �           2606    16493    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    242            �           2606    16495 *   transmission_types transmission_types_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.transmission_types
    ADD CONSTRAINT transmission_types_pkey PRIMARY KEY (transmission_type_id);
 T   ALTER TABLE ONLY public.transmission_types DROP CONSTRAINT transmission_types_pkey;
       public                 postgres    false    244            �           2606    16496 K   additional_options_order additional_options_order_additional_option_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.additional_options_order
    ADD CONSTRAINT additional_options_order_additional_option_id_fkey FOREIGN KEY (additional_option_id) REFERENCES public.additional_options(additional_option_id);
 u   ALTER TABLE ONLY public.additional_options_order DROP CONSTRAINT additional_options_order_additional_option_id_fkey;
       public               postgres    false    4778    219    217            �           2606    16501 ?   additional_options_order additional_options_order_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.additional_options_order
    ADD CONSTRAINT additional_options_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 i   ALTER TABLE ONLY public.additional_options_order DROP CONSTRAINT additional_options_order_order_id_fkey;
       public               postgres    false    4802    219    242            �           2606    16506 '   applications applications_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 Q   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_order_id_fkey;
       public               postgres    false    242    4802    221            �           2606    16511 )   car_fuel_types car_fuel_types_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_fuel_types
    ADD CONSTRAINT car_fuel_types_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 S   ALTER TABLE ONLY public.car_fuel_types DROP CONSTRAINT car_fuel_types_car_id_fkey;
       public               postgres    false    4788    225    227            �           2606    16516 /   car_fuel_types car_fuel_types_fuel_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_fuel_types
    ADD CONSTRAINT car_fuel_types_fuel_type_id_fkey FOREIGN KEY (fuel_type_id) REFERENCES public.fuel_types(fuel_type_id);
 Y   ALTER TABLE ONLY public.car_fuel_types DROP CONSTRAINT car_fuel_types_fuel_type_id_fkey;
       public               postgres    false    4794    225    234            �           2606    16521    cars cars_body_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_types(body_type_id);
 E   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_body_type_id_fkey;
       public               postgres    false    227    223    4784            �           2606    16526    cars cars_drive_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_drive_type_id_fkey FOREIGN KEY (drive_type_id) REFERENCES public.drive_types(drive_type_id);
 F   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_drive_type_id_fkey;
       public               postgres    false    232    227    4792            �           2606    16531 #   cars cars_transmission_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_transmission_type_id_fkey FOREIGN KEY (transmission_type_id) REFERENCES public.transmission_types(transmission_type_id);
 M   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_transmission_type_id_fkey;
       public               postgres    false    227    244    4804            �           2606    16536    applications fk_application_car    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_application_car FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 I   ALTER TABLE ONLY public.applications DROP CONSTRAINT fk_application_car;
       public               postgres    false    4788    221    227            �           2606    16541 !   applications fk_application_order    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_application_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 K   ALTER TABLE ONLY public.applications DROP CONSTRAINT fk_application_order;
       public               postgres    false    221    4802    242            �           2606    16546 (   applications fk_application_order_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_application_order_status FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 R   ALTER TABLE ONLY public.applications DROP CONSTRAINT fk_application_order_status;
       public               postgres    false    221    4800    240            �           2606    16551 %   applications fk_applications_managers    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_applications_managers FOREIGN KEY (manager_id) REFERENCES public.managers(manager_id);
 O   ALTER TABLE ONLY public.applications DROP CONSTRAINT fk_applications_managers;
       public               postgres    false    236    4796    221            �           2606    16556    orders fk_order_client    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_client FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_order_client;
       public               postgres    false    4790    242    230            �           2606    16561    orders fk_order_manager    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_manager FOREIGN KEY (manager_id) REFERENCES public.managers(manager_id);
 A   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_order_manager;
       public               postgres    false    242    4796    236            �           2606    16566    orders fk_order_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_status FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_order_status;
       public               postgres    false    4800    242    240            �           2606    16571    order_car order_car_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_car
    ADD CONSTRAINT order_car_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 I   ALTER TABLE ONLY public.order_car DROP CONSTRAINT order_car_car_id_fkey;
       public               postgres    false    4788    227    238            �           2606    16576 !   order_car order_car_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_car
    ADD CONSTRAINT order_car_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 K   ALTER TABLE ONLY public.order_car DROP CONSTRAINT order_car_order_id_fkey;
       public               postgres    false    238    242    4802            �           2606    16581    orders orders_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_client_id_fkey;
       public               postgres    false    4790    230    242            �           2606    16586    orders orders_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.managers(manager_id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_manager_id_fkey;
       public               postgres    false    242    4796    236            i   �   x����
�@��Oqw����*q!�Acm�S����w]� �:?g�9On�yq�ޖ��|�ki�V�>u���svO8l\nՠ��� b�gl{rҿ�!�@ӈ8�HT��Y!Y9N��|���;����]���b�ĀD�Q�B�V�M�VJTFN��d�?�q���xG      k   �   x����
�0��y�=*�&�O�A�B�J5
Ŗ��oR��0��>�f���8Pڕ0|�]�X4޷��5]�����?G(+i�:*}{�N^�:����Z��2���¥�A��|�r|*�@ S��k��k���c���b��b7��Tݮi�|��->��IbI� XYAЬL�,�Ÿ2�~^d�H      m   �   x���1�0�=��*ؒ\�&'��`�{u*����K�l�w��{a��a�N?��r������z��z8^�6nZ��rk]������{�4Q�X�i3(��צ/̴�)�+L�&fZ�lJR�����L�MIӘ/Z�hk      o   h   x���v
Q���W((M��L�K�O��/�,H-Vs�	uV�0�QPNMI�S״��$J�HKh���B�J����b��X����H�6S�6��҂T�.. ��N�      q      x���v
Q���W((M��L�KN,�O+M͉/�,H-V�s
�t��sW�q�Us�	u���
�:
 �i��I����*f2"��e��	��:͔Z�BfT|Csj�̂Z��b�h ��N      s   �  x����n�0E���ٹ�c确���HM"}dI�6T"����q�v�H#�Xf�{�co�~�,�æ^�Yl�Q������޽7�@�Bw
/wOϮ\�� ay*w���:�E�X�eY�e`c0�������#�,zM!Z	Ŋ�fjr�{��;2s��6?M�kn�:�������x�D�\'�,�g�$��
��d��\\�a�ҩ�v$���ԁ-�#��N[�U#�7����"�F�h�
o\�9����p�*�_Q"�c���f���(�m���6��mY�G~)�Lƫt_�y�� ��i%�M��Y�Dw�05#SRqdC���Ȧ�D&�H�<��1��nQݥ��;�PV	L��.w���~���س����L�+zK��Pf�{\5���Ti�nY߅�n!E!d���      v   �  x�ŒKo�@����Y��&���tS��W#���(�2a`���w KjH�i�2��s'��ka�5��%:�w���=�$�N�?�6zP�Pc�J��4uϞK�4��l���adG��d>���B.�?0"�_�H�ޖ:�^S��t�Qhp�*�Y��U\W���0mǰ=���x�ј���3�ixy3z�|h2_>&�;�.U��C1����s��V��������z\���fr�2O�Yn!{ݎ��5��*�p$�U�� �RY�����8�	Z�4�{�9*l���OC�0�c�<�2�HXNܒ�.wDm��D��������9���X\� dHHT��ɻz�@��[�6'y�U���`�b ��E�������QEX|����<��(K��"�վ ٭T[      x   t   x���v
Q���W((M��L�K)�,K�/�,H-Vs�	uV�0�QPw+��+��HM�Qp�Q״��$N�PPjb�ڍ��sr��mr|~)����$��d�*`3�� ��g)      z   v   x���v
Q���W((M��L�K+M͉/�,H-Vs�	uV�0�QPwO,����KU״��$J�P�Kfjqj�z��z\sR�K�2���e��Q�T��B�S��ĒҢ���@�� S�      |   �  x�Œ�n�0E�|�H�R'!��)�Җ�xU,��� 	��;�!Ut�E%f��ܹ�c;��hB�p2 ��B��Ck�fd���zc򤿐������ �Ӷ����ɘ�s�����T�����r���Nc��Py�����P�*��Ϊ#�%ͅ�q+(\��^來���~�ǡ�ڮ.cm_v���|�V��V��f���Q������a�$W,�y�R��8d ѕ��H����4MjYm`��ݱ����ҁld)�ym��C�"�W��R�7�=�m��q�b����u��pLu�<�"[n RF�Ip�+���Wѯo��T=�������| ��-!dy	d�R$�Lp�.9�w��=NNQN��,��q~�f�T��$4{      ~   o   x���v
Q���W((M��L��/JI-�ON,R�s
�t��sW�q�Us�	u���
�:
 �i��I�1F:
 D�1�:
 D�1&:
 D�1�:
 D�1� 6 f�y�      �   W   x���v
Q���W((M��L��/JI-�/.I,)-Vs�	uV�0�QP��/Qp��-�I-IMQ״��$R�P3Y-A�R�ڸ� aM7      �   �   x���v
Q���W((M��L��/JI-*Vs�	uV�0�Q� C if``�g`���nd`d�k`�k`��i��I�ScfH�1&:
d$��5��225%�#�dD�1�0�X�13F1��H��d ��g�      �   z   x���v
Q���W((M��L�+)J�+��,.��ϋ/�,H-Vs�	uV�0�QP�M�+M�Q״��$I�P�ciI~nbIf2�ڍ�ڝ�BH�h�����K��@3\���u�)-I� �� �f`     
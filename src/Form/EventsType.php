<?php

namespace App\Form;

use App\Entity\Events;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;



class EventsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, ["attr"=>["placeholder"=>"Enter the Event name", "class"=>"form-control mb-4"]])
            ->add('date', DateTimeType::class, ["attr"=>["class"=>"form-control mb-4"]])
            ->add('description', TextareaType::class, ["attr"=>["placeholder"=>"Enter the Event description", "class"=>"form-control mb-4"]])
            ->add('picture', FileType::class, [
                'label' => 'Choose a picture (png, jpg, jpeg file)',
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new File([
                        'maxSize' => '5120k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpg',
                            'image/jpeg',
                        ],
                        'mimeTypesMessage' => 'Upload a valid picture file',
                    ])
                ],
            ])
            ->add('capacity', TextType::class, ["attr"=>["placeholder"=>"Enter the Event maximum capacity", "class"=>"form-control mb-4"]])
            ->add('email', TextType::class, ["attr"=>["placeholder"=>"Enter e-mail", "class"=>"form-control mb-4"]])
            ->add('phoneNumber', TextType::class, ["attr"=>["placeholder"=>"Enter the phone number", "class"=>"form-control mb-4"]])
            ->add('address', TextType::class, ["attr"=>["placeholder"=>"Enter the Event address", "class"=>"form-control mb-4"]])
            ->add('url', TextType::class, ["attr"=>["placeholder"=>"Enter URL", "class"=>"form-control mb-4"]])
            ->add('type', ChoiceType::class,[
                'choices' => [
                    'Advent' => "Advent",
                    'Family' => "Family",
                    'Sports' => "Sports",
                    'Musical' => "Musical",
                    'Concerts' => "Concerts", 

                ],  "attr"=> ["class"=>"form-control mb-5"]
            ])
            ->add('Done', SubmitType::class, ["attr"=>["class"=>"btn btn-primary"]])
        ;
    }


public function configureOptions(OptionsResolver $resolver): void
{
    $resolver->setDefaults([
        'data_class' => Events::class,
    ]);
   }

}
